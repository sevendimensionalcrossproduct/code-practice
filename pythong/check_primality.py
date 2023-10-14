# Check primality:
try:
    number = int(input('Even a positive integer: '))

    if number < 1:
        print('Input must be greater than zero.')
        pass

    while True:
        prime = True
        for divisor in range(2, number):
            if number % divisor == 0:
                prime = False
        break

    if prime and number != 1:
        print(number, 'is a prime number.')
    else:
        print(number, 'is not a prime number.')

except ValueError:
    print('Error: Not an integer.')
