# Primality in an interval
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
                i = i+1
                HasDivisors = False
                for j in range(2, i-1):
                    if (i-1) % j == 0:
                        HasDivisors = True
                        break
                if HasDivisors:
                    print(i-1, "is not a prime number.")
                elif i-1 == 1:
                    print(i-1, "is not a prime number")
                else:
                    print(i-1, "is a prime number.")
            break
    except ValueError:
        print('Your input must be a positive integer.')
        break
