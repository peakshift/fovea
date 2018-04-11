import os
from dotenv import load_dotenv
from functions import csv_to_list, write_to_csv

load_dotenv()

original_csv = os.getenv("ORIGINAL_CSV_FILE")
transformed_csv = os.getenv("TRANSFORMED_CSV_FILE")
fieldnames_1 = ['TransactionDate', 'Description', 'Payee', 'Reference', 'Debit', 'Credit']
fieldnames_2 = ['TransactionDate', 'Description', 'Payee', 'Reference', 'Amount']

# Get transactions list from csv file
reader = csv_to_list( original_csv, fieldnames_1 )

# Create new csv file for transactions
write_to_csv( transformed_csv, reader, fieldnames_2 )
