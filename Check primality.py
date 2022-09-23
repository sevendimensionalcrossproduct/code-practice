# Check primality
while True:
    try:
        num = int(input("Even a positive integer:"))
        if 1 > num:
            print("Input must be a positive natural number.")
            break
        else:
            flag = False
            for i in range(2, num):
                if num % i == 0:
                    flag = True
                    break
        if flag:
            print(num, "is not a prime number.")
        else:
            print(num, "is a prime number.")
        break
    except ValueError:
        print('Your input must be an integer.')
        break
