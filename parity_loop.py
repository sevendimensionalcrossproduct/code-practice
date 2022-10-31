# Even and odd numbers endless loop:
try:
    number = int(input('Select starting point: '))

    while True:        
        if number % 2 == 0:
            print(number, 'is even.')
        else:
            print(number, 'is odd')

        number = number + 1

except ValueError:
    print('Error: Not an integer.')
