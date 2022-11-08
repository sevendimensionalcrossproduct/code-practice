#lab6_3

print('MENU:')
menu = {'coffee': 15, 'tea':7,'cheese toast':25,'water':5}

print('\n1. Find item by name\n2. Find item by price\n3. Add new item\n4. Delete item\n5. Show item menu\n6. Show instruction menu\n7. Exit program\n')

for ass, poop in menu.items():
        print(ass, poop)

print('')

while True:    
    try:
        option = int(input('Instruction: '))
        
        def choice1():
            item = input("enter name of item: ")
        
            if item in menu:
                print("the price of ", item, "is", menu[item],'\n')
                
            else:
                print('the item "' + item + '" is not in the menu\n')
    
        def choice2():
            try:
                budget = int(input('Enter budget:'))
                
                if budget < 1:
                    print('Input must be a positive number\n')
        
                elif budget < min(menu.values()):
                    print("No items within budget found\n")
                
                else:
                    print("Items within budget:")
                    for ass, sex in menu.items():
                        if sex <= budget:
                            print(ass, sex)
                print('\n')

            except ValueError:
                print('Not an integer\n')
            
        def choice3():
            try:
                name = str(input("Enter new item name: "))
                if name in menu.keys():
                    print(name,"is already on the menu\n")
                
                else:
                    price = int(input("Enter item price: "))
                
                    if price <= 0:
                        print("Price must be a positive number\n")
                    
                    else:
                        menu[name] = price
                        print("\nThe updated menu is:\n")
                    
                        for cream,pie in menu.items():
                            print(cream,pie)
                print('')

                        
            except ValueError:
                print("bruh\n")
            
        def choice4():
            delete = str(input("Enter item to be deleted from menu: "))
            
            if delete in menu.keys():
                del menu[delete]
                print("\nThe updated menu is:\n")
                
                for left_asscheek,right_asscheek in menu.items():
                    print(left_asscheek, right_asscheek)
                print('')
                    
            else:
                print('Entry: "' + str(delete) + '" is not on the menu\n')
    
        if not 1 <= option <= 7:
            print ("poo\n")
        
        elif option == 1:
            choice1()
        
        elif option == 2:
            choice2()
        
        elif option == 3:
            choice3()
        
        elif option == 4:
            choice4()
        
        elif option == 5:
            pass
        
        elif option == 6:
            pass
        
        elif option == 7:
            print("Byebye")
            break
        
    except ValueError:
        print("wtf\n")
