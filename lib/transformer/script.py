from dotenv import load_dotenv
load_dotenv()

import os
import csv

# Read csv file
original_csv = os.getenv("ORIGINAL_CSV_FILE")
transformed_csv = os.getenv("TRANSFORMED_CSV_FILE")

with open(original_csv, 'r') as csv_file:
    fieldnames = ['TransactionDate', 'Description', 'Payee', 'Reference', 'Debit', 'Credit']
    reader = csv.DictReader(csv_file, fieldnames=fieldnames)

    # Write csv file
    with open(transformed_csv, 'w') as new_csv_file:
        writer = csv.DictWriter(new_csv_file, fieldnames=['TransactionDate', 'Description', 'Payee', 'Reference', 'Amount'])

        # Include fieldnames in file
        writer.writeheader()

        for index, row in enumerate(reader):
            # Skip old header row
            if index == 0:
                continue

            # Replace 'debit' and 'credit' fields with 'transaction amount'
            debit = row['Debit']
            credit = row['Credit']

            if debit == '':
                row['Amount'] = credit
            elif credit == '':
                row['Amount'] = debit

            del row['Debit']
            del row['Credit']

            writer.writerow(row)
