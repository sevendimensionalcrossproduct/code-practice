# Primality on an interval
while True:
    try:
        LowerBound = int(input("Prime numbers from:"))
        UpperBound = int(input("to:"))
        if UpperBound <= LowerBound:
            print("Upper bound must be strictly greater than lower bound.")
        elif LowerBound < 1:
            print("Lower bound must be a positive integer")
            break
        else:
            i = LowerBound
            while LowerBound <= i <= UpperBound:
                HasDivisors = False
                for j in range(2, i):
                    if i % j == 0:
                        HasDivisors = True
                        break
                if HasDivisors:
                    print(i, "is not a prime number.")
                elif i == 1:
                    print(i, "is not a prime number")
                else:
                    print(i, "is a prime number.")
                i = i+1
            break
    except ValueError:
        print('Your input must be a positive integer.')
        break
