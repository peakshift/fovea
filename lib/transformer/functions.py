import csv

# Get list from csv file
def csv_to_list( file, fieldnames=None ):
    with open(file, 'r') as csv_file:
        reader = csv.DictReader(csv_file, fieldnames=fieldnames)
        return list(reader);

# Create new csv file
def write_to_csv( file_to_write, dict_to_read, fieldnames=None ):
    with open(file_to_write, 'w') as new_csv_file:
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


# Transform row to replace 'debit' and 'credit' fields with 'transaction amount'
def transform_row( row ):
    debit = row['Debit']
    credit = row['Credit']

    if debit == '':
        row['Amount'] = credit
    elif credit == '':
        row['Amount'] = debit

    del row['Debit']
    del row['Credit']
    return row;
