#gui that prints a triangle lol
from tkinter import *

penis = Tk()

penis.geometry('360x290')
penis.title('THIS IS A FUCKING RIGHT TRIANGLE')
penis.iconbitmap('18vxahbvpu1cdjpg.ico')
penis.resizable(False, False)

cock = LabelFrame(penis, text='RIGHT TRIANGLE')
cock.pack(fill='both', expand='yes', padx=10, pady=10)

vagina = {1:'THIS',2:'IS',3:'A',4:'FUCKING',5:'RIGHT',6:'TRIANGL',7:'↲'} 

[Label(cock, text=vagina[description], font=('Arial')).grid(row=description, column=50) for description in range(1,8)]

[Label(cock, text='l', font=('Arial')).grid(row=vertical, column=0) for vertical in range(1,9)]

[Label(cock, text='-', font=('Arial')).grid(row=9, column=horizontal) for horizontal in range(1,10)]

[Label(cock, text='╲', font=('Arial')).grid(row=diagonal, column=diagonal) for diagonal in range(1,9)]

Label(cock, text=' ∟', font=('Arial')).grid(row=9, column=0)
    
penis.mainloop()
