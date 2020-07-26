import datetime as dt
import json
import os
from pathlib import Path

import pystache


ACCOUNT_NO = os.environ['ACCOUNT_NO']
IBAN = os.environ['IBAN']
BIC_SWIFT = os.environ['BIC_SWIFT']
CURR_SYMBOL = os.environ['CURR_SYMBOL']


DATE_FORMAT = "%d %B %Y"

templates_and_views = [
    'left_details',
    'right_details',
    'amount',
    'table',
]

RENDER_DIR = os.environ.get('RENDER_DIR', '')
default_view = 'sample_views/{}.json'
default_template = 'templates/{}.html'

default_view = str(RENDER_DIR / Path(default_view))
default_template = str(RENDER_DIR / Path(default_template))


def generate_location(name, is_view=False):
    loc = default_template.format(name)
    if is_view:
        loc = default_view.format(name)

    return loc

def fetch_file(label, is_view=False):
    filename = generate_location(label, is_view=is_view)
    with open(filename, 'r') as f:
        result = f.read()

    return json.loads(result) if is_view \
            else result

def render(label, view):
    template_filename = default_template.format(label)
    with open(template_filename, 'r') as f:
        template = f.read()

    return pystache.render(template, view)


def load_json(filepath):
    with open(filepath, 'r') as f:
        return json.loads(f.read())

def render_left_details(from_=None, to_=None, label='left_details'):
    # Sample views as backups
    path = Path(default_view).parent / 'entities'
    from_file, to_file = 'peakshift.json', 'client.json'
    from_sample, to_sample = load_json(path/from_file), load_json(path/to_file)

    # Choose sample views if args not passed
    from_ = from_ or from_sample
    to_ = to_ or to_sample

    view = {
        'entities': [
            {'head': 'From', **from_},
            {'head': 'To', **to_},
        ]
    }

    return render(label, view)

def parse_date(date=None, date_format=DATE_FORMAT, UTC_OFFSET=+2):
    utc_time = dt.datetime.utcnow()
    local_time = utc_time + dt.timedelta(hours=UTC_OFFSET)
    local_date = local_time.strftime(date_format)

    if (date is not None) and isinstance(date, dt.datetime):
        local_date = date.strftime(date_format)

    return local_date

def subtract_month(date):
    prev_month = date.month - 1
    prev_year = date.year
    if prev_month == 0:
        prev_month = 12
        prev_year = date.year - 1

    prev_date = dt.datetime(prev_year, prev_month, 1)
    return prev_month, prev_year, prev_date

def define_period(parsed_date, date_format=DATE_FORMAT):
    local_date = dt.datetime.strptime(parsed_date, date_format)

    end_month, end_year, end_date = subtract_month(local_date)
    start_month, start_year, _ = subtract_month(end_date)
    if local_date.day > 28:
        end_month, end_year = local_date.month
        start_month, start_year = subtract_month(local_date.month)

    end_date = dt.datetime(end_year, end_month, 28, 23, 59, 59)
    start_date = dt.datetime(start_year, start_month, 28, 0) + dt.timedelta(1)

    time_format = "%d %B %Y %I:%M%p"

    return parse_date(start_date, time_format), \
           parse_date(end_date, time_format)

def render_right_details(title='', ref_num=None, inv_num=None, date=None, period_start=None, period_end=None, label='right_details'):
    # date values
    current_date = parse_date()
    start_date, end_date = define_period(current_date)

    view = {
        "title": title,
        "ref": {"title": "REF",},
        "invoice": {"title": "INVOICE"},
        "date": {"title": "written on"},
        "start": {"title": "period start"},
        "end": {"title": "period end"},
    }
    view['ref']['number'] = ref_num or '<missing>'
    view['invoice']['number'] = inv_num or '<missing>'
    view['date']['date'] = current_date
    view['start']['date'] = period_start or start_date
    view['end']['date'] = period_end or end_date

    # Sample views as backups
    filename = default_view.format(label)
    view_sample = load_json(filename)

    if (ref_num is None) and (inv_num is None):
        view = view_sample

    return render(label, view)


def render_table(rows=None, label='table'):
    # Sample views as backups
    filename = default_view.format(label)
    rows_sample = load_json(filename)

    # Choose sample views if args not passed
    rows = rows or rows_sample

    view = {'rows': rows}

    return render(label, view), rows

def parse_currency(dollars, curr_symbol=CURR_SYMBOL):
    '''
    Converts string currencies to cents to
    perform math on (never use floats for
    currency calcs).
    '''
    as_string = dollars.replace(curr_symbol, '').replace(',', '')
    as_float = round(float(as_string), 2)
    cents = int(as_float * 100)

    return cents

def render_amount(rows, vat_rate=0, curr_symbol=CURR_SYMBOL, label='amount'):
    amounts = [
        {"title": "TOTAL AMOUNT DUE"},
        {"title": f"VAT {vat_rate*100:.1f}%*"},
        {"title": "GRAND TOTAL"}
    ]

    # Parse amounts from 'rows', convert to cents
    amount_strings = [row['total']['amount'] for row in rows]
    amounts_in_cents = [parse_currency(amt) for amt in amount_strings]

    # Calculate totals
    total = 0
    [total := total + amt for amt in amounts_in_cents]
    vat = total * vat_rate
    grand_total = total + vat

    values = [total, vat, grand_total]

    # Build view
    for item, amt in zip(amounts, values):
        item['amount'] = f"{curr_symbol}{amt/100:,.2f}"

    view = {'amounts': amounts}

    return render(label, view)


def render_index(from_=None, to_=None, work_type='', ref_num=None, inv_num=None, date=None, rows=None, label='index'):
    # Build/fetch views
    left_details = render_left_details(from_, to_)
    right_details = render_right_details(work_type, ref_num, inv_num, date)
    table, rows = render_table(rows)
    amount = render_amount(rows)

    view = {
        'right_details': right_details,
        'left_details': left_details,
        'table': table,
        'amount': amount,
        'account_no': ACCOUNT_NO,
        'iban': IBAN,
        'bic_swift': BIC_SWIFT,
    }

    return render(label, view)


if __name__ == "__main__":
    html = render_index()

    print(html)
    with open('invoice/index.html', 'w') as f:
        f.write(html)
