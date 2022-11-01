# Simple Calculator
try:
    num1 = int(input("Enter first integer:"))
    num2 = int(input("Enter second integer:"))
           
    print("Selected first number", num1)
    print("Selected second number", num2)
           
    print(num1," plus ",num2," is ", num1+num2)
    print(num1," times ",num2," is ", num1*num2)

    print(num1," minus ",num2," is ", num1-num2)
    print(num1," divided by ",num2," is ", float(num1/num2))

    print("The remainder is",num1%num2)
    break
    
except ValueError:
    print("Error: Not an integer.")
