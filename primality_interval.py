# Primality on an interval:
try:
    lower_bound = int(input('Prime numbers from: '))
    upper_bound = int(input('to: '))
    
    if upper_bound <= lower_bound:
        print('Upper bound must be greater than lower bound.')
        
    elif lower_bound < 1:
        print('Lower bound must be a positive integer')
        
    else:
        number = lower_bound
        while lower_bound <= number <= upper_bound:
            prime = True
            for divisor in range(2, number):
                if number % divisor == 0:
                    prime = False
                    break

            if prime and number != 1:
                print(number, 'is a prime number.')
            else:
                print(number, 'is not a prime number.')
                
            number = number + 1
except ValueError:
    print('Not an integer.')
