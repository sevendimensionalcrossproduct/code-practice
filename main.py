try:
    num = input("Enter number ")
    try:
        if int(num % 2) == int(1):
            print(num, "is odd")
        elif int(num % 2) == int(0):
            print(num, "is even")
        except:
            print("fuck you"):
except:
    print("ur mom")