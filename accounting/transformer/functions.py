import csv
from romanise import cyr_to_latin

# Get list from csv file
def csv_to_list( file, fieldnames=None ):
    file_path = 'csv_files/original/' + file

    with open(file_path, 'r') as csv_file:
        reader = csv.DictReader(csv_file, fieldnames=fieldnames)
        return list(reader);

# Create new csv file
def write_to_csv( file_to_write, dict_to_read, fieldnames=None ):
    file_path = 'csv_files/transformed/' + file_to_write

    with open(file_path, 'w') as new_csv_file:
        writer = csv.DictWriter(new_csv_file, fieldnames=fieldnames)

        # Include fieldnames in file
        writer.writeheader()

        for index, row in enumerate(dict_to_read):
            # Skip old header row
            if index == 0:
                continue

            # Clean row
            new_row = transform_row(row)

            # Write row to file
            writer.writerow(new_row)


# Transform row
def transform_row( row ):
    debit = row['Debit']
    credit = row['Credit']

    # Replace 'debit' and 'credit' fields with 'transaction amount'
    if debit == '':
        row['Amount'] = float(credit) * -1
    elif credit == '':
        row['Amount'] = debit

    del row['Debit']
    del row['Credit']

    # Convert cyrillic letters to latin
    row['Description'] = cyr_to_latin(row['Description'])
    row['Payee'] = cyr_to_latin(row['Payee'])

    return row;
