# Even and odd numbers loop
while True:
    try:
        LowerBound = int(input("Even and odd numbers from:"))
        UpperBound = int(input("to:"))
        if UpperBound <= LowerBound:
            print("Upper bound must be strictly greater than lower bound.")
            break
        else:
            i = LowerBound
            while LowerBound <= i <= UpperBound :
                i = i+1
                if i%2 == 0:
                    print(i-1, "is odd")
                elif i%2 == 1:
                    print(i-1, "is even")
            break
    except ValueError:
        print("Your input must be an integer")
        break
