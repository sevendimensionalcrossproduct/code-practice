# Primality endless loop
while True:
    try:
        starting_point = int(input("Prime numbers from:"))
        if starting_point < 1:
            print("Lower bound must be a positive integer")
            break
        else:
            i = starting_point
            while starting_point <= i:
                HasDivisors = False
                for j in range(2, i):
                    if i % j == 0:
                        HasDivisors = True
                        break
                if HasDivisors:
                    pass
                elif i == 1:
                    pass
                else:
                    print(i, "is a prime number.")
                i = i+1
            break
    except ValueError:
        print('Your input must be a positive integer.')
        break
