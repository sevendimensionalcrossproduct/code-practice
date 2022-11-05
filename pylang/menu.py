#lab6_3

print('MENU:')
menu = {'coffee': 15, 'tea':7,'cheese toast':25,'water':5}
for ass, poop in menu.items():
    print(ass ,poop)

try:
    def choice1():
        item = input("enter name of item: ")
        
        if item in menu:
            print("the price of ", item, "is", menu[item])
                
        else:
            print('the item "' + item + '" is not in the menu')
    
    def choice2():
        try:
            budget = int(input('Enter budget:'))
        
            if budget < min(menu.values()):
                print("No items within budget found")
                
            else:
                print("Items within budget:")
                for ass, sex in menu.items():
                    if sex <= budget:
                        print(ass, sex)

        except ValueError:
            print('Not an integer')
            
    def choice3():
        try:
            name = str(input("Enter new item name: "))
            if name in menu.keys():
                print(name,"is already on the menu")
                
            else:
                price = int(input("Enter item price: "))
                menu[name] = price
                print("The new menu is:")
                for cream,pie in menu.items():
                    print(cream,pie)
                    
        except ValueError:
            print("bruh")

    option = int(input('\n1. Find item by name\n2. Find item by price\n3. Add new item\n4. Delete item\n'))
    
    if not 1 <= option <= 4:
        print ("poo")
        
    elif option == 1:
        choice1()
        
    elif option == 2:
        choice2()
        
    elif option == 3:
        choice3()
        
    elif option == 4:
        choice4()
        
except ValueError:
    print("wtf")
