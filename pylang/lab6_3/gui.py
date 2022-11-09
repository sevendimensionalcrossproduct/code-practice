from tkinter import *

#Menu
menu = {'coffee': 15, 'tea':7,'cheese toast':25,'water':5}

#Functions

def add_item():
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
        print("Input must be an integer\n")
        
def delete_item():
    delete = str(input("Enter item to be deleted from menu: "))
            
    if delete in menu.keys():
        del menu[delete]
        print("\nThe updated menu is:\n")
                
        for left_asscheek,right_asscheek in menu.items():
            print(left_asscheek, right_asscheek)
                    
        print('')
                    
    else:
        print('Entry: "' + str(delete) + '" is not on the menu\n')

#GUI properties
ass = Tk()
ass.title('lab6_3')
ass.geometry('400x400')
ass.resizable(True,True)

#GUI components

item_label = LabelFrame(ass, text='Items')
item_label.grid(row=2,column=1,padx=2,pady=5)
[Label(item_label, text=ass).pack(pady=1, side= TOP) for ass in menu.keys()]

price_label = LabelFrame(ass, text='Price')
price_label.grid(row=2,column=2,padx=2,pady=5)
[Label(price_label, text=(sex,'$')).grid(row=sex,column=2,pady=1) for sex in menu.values()]

options = LabelFrame(ass, text='Options')
options.grid(row=1,column=1,padx=10)

optext = Label(options, text=('1. Add new item\n2. Delete item\n3. Exit program'))
optext.grid(row=0,column=1,pady=1)

ass.mainloop()
