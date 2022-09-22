while True:
    try:
        num = int(input("Enter number "))
        if int(num % 2) == int(1):
            print(num, "is odd")
        elif int(num % 2) == int(0):
            print(num, "is even")

        break
    except ValueError:
        print("\nur mom")
        break
