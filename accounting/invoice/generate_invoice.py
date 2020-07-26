from fetch_hours.utils import shell_source

print("Sourcing envs...")
shell_source('./env_sample')
print("Sourced!")

import os
import json
from pathlib import Path

from fetch_hours.fetch import run as generate_report
from render_invoice.render import render_index, CURR_SYMBOL


CLIENT = os.environ['CLIENT']
PROVIDER = os.environ['PROVIDER']
REF_NUM = os.environ['REF_NUM']
INV_NUM = os.environ['INV_NUM']
WORK_TYPE = os.environ['WORK_TYPE']
RATE = float(os.environ['RATE'])


DATA_PARENT = Path('invoice_data')


def load_json(filename, parent=''):
    filename = filename.replace('.json', '')
    filepath = DATA_PARENT / parent / f"{filename}.json"
    with open(filepath, 'r') as f:
        return json.loads(f.read())

def build_row(title, details, rate, curr_symbol=CURR_SYMBOL):
    row = {
        'label': {'text': ''},
        'description': {},
        'quantity': {},
        'total': {},
    }

    row['description']['title'] = title

    quantity = round(details['hours'], 2)
    total = round(quantity * rate, 2)
    row['quantity']['amount'] = f"{quantity:.2f}"
    row['total']['amount'] = f"{curr_symbol}{total:,.2f}"

    return row

def pass_to_render(report):
    kwargs = {
        'from_': load_json(PROVIDER, 'entities'),
        'to_':  load_json(CLIENT, 'entities'),
        'work_type': WORK_TYPE,
        'ref_num': REF_NUM,
        'inv_num': INV_NUM,
        'date': None,
    }
    kwargs['rows'] = [build_row(title, details, rate=RATE) for title, details in report.items()]

    return render_index(**kwargs)

if __name__ == "__main__":
    print(f"Fetching report from Harvest... ")
    date_range = {
        "from": "20200529",
        "to":"20200628"
    }
    try:
        # Uncomment below to use cache
        raise Exception("Using cached data and skipping fetch")
        report = generate_report(date_range)
        print(f"fetched!")
    except Exception as e:
        data_file = "fetch_hours/dump.json"
        print(e)
        print(f"Could not fetch new data from endpoint, using old data at '{data_file}'")
        with open(data_file, "r") as f:
            report = json.loads(f.read())

    print("Rendering html invoice from data...")
    html = pass_to_render(report)
    print(f'rendered!')

    index_path = 'render_invoice/invoice/index.html'
    print(f'Writing report to {index_path}... ')
    with open(index_path, 'w') as f:
        f.write(html)
    print(f'done!')
    print(f"Open this page in browser to view report: {Path(index_path)}")
