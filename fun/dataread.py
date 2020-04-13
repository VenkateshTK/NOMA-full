import csv

with open('dataset.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            print(f'Column names are {", ".join(row)}')
            line_count += 1
        else:
            print(f'\t h1:{row[0]} h2:{row[1]} h3:{row[2]} totalpower:{row[7]}')
            line_count += 1
    print(f'Processed {line_count} lines.')
