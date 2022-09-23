# Even and odd numbers endless loop
while True:
    try:
        Boundary = int(input("Select starting point:"))
        i = Boundary
        while Boundary <= i :
            i = i + 1
            if i % 2 == 0:
                print(i - 1, "is odd")
            elif i % 2 == 1:
                print(i - 1, "is even")
        break
    except ValueError:
        print('Your input must be an integer.')
        break
