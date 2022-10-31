# Primality endless loop

try:
    bound = int(input('Prime numbers from: '))
        
    if bound < 1:
        print('Your input must be greater than zero.')
        pass

    number = bound
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
    print('Your input must be a positive integer.')
