# Even and odd numbers loop:
try:
    lower_bound = int(input("Even and odd numbers from: "))
    upper_bound = int(input("to: "))
    
    if upper_bound <= lower_bound:
        print("Upper bound must be greater than lower bound.")
    
    elif lower_bound < upper_bound:
        i = lower_bound
    while lower_bound <= i <= upper_bound:
        if i % 2 == 0:
            print(i, "is even")
        else:
            print(i, "is odd")
            
        i = i+1
        
except ValueError:
    print("Your input must be an integer")
