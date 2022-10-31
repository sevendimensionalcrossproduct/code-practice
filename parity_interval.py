# Even and odd numbers loop:
try:
    lower_bound = int(input('Even and odd numbers from: '))
    upper_bound = int(input('to: '))
    
    if upper_bound <= lower_bound:
        print('Upper bound must be greater than lower bound.')
    
    elif lower_bound < upper_bound:
        number = lower_bound
    while lower_bound <= number <= upper_bound:
        if number % 2 == 0:
            print(number, 'is even')
        else:
            print(number, 'is odd')
            
        number = number + 1
        
except ValueError:
    print("Your input must be an integer")
