# Primality endless loop:
try:
    number = int(input('Prime numbers from: '))
        
    if number < 1:
        print('Input must be greater than zero.')
        pass

    while True:
        has_divisors = False
        for divisor in range(2, number):
            if number % divisor == 0:
                has_divisors = True
                break
                    
        if not has_divisors and number != 1:
            print(number, 'is prime.')
                
                
        number = number + 1
        
except ValueError:
    print('Error: Not an integer.')
