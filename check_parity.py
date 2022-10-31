# Check if input is even or odd:
try:
    number = int(input("Enter integer: "))
        
    if int(number % 2) == 0:
        print(number, "is even.")
    else:
        print(number, "is odd.")

except ValueError:
    print("Error: Not an integer.")
