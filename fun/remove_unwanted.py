import csv
with open('dataset.csv', 'rb') as inp, open('first_edit.csv', 'wb') as out:
    csv_reader = csv.reader(inp, delimiter=',')
    writer = csv.writer(out)
    for row in csv_reader:
        print(f'\trow[9]')
