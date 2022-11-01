#gui that prints a triangle lol
from tkinter import *

penis = Tk()

penis.iconbitmap('18vxahbvpu1cdjpg.ico') #wont work without ico file
penis.geometry('360x290')
penis.title('THIS IS A FUCKING RIGHT TRIANGLE')
penis.resizable(False, False)

cock = LabelFrame(penis, text='RIGHT TRIANGLE')
cock.pack(fill='both', expand='yes', padx=10, pady=10)

Label(cock, text='THIS', font=('Arial')).grid(row=1, column=50)
Label(cock, text='IS', font=('Arial')).grid(row=2, column=50)
Label(cock, text='A', font=('Arial')).grid(row=3, column=50)
Label(cock, text='FUCKING', font=('Arial')).grid(row=4, column=50)
Label(cock, text='RIGHT', font=('Arial')).grid(row=5, column=50)
Label(cock, text='TRIANGEL', font=('Arial')).grid(row=6, column=50)
Label(cock, text='↲', font=('Arial')).grid(row=7, column=50)

Label(cock, text='l', font=('Arial')).grid(row=1, column=0)
Label(cock, text='l', font=('Arial')).grid(row=2, column=0)
Label(cock, text='l', font=('Arial')).grid(row=3, column=0)
Label(cock, text='l', font=('Arial')).grid(row=4, column=0)
Label(cock, text='l', font=('Arial')).grid(row=5, column=0)
Label(cock, text='l', font=('Arial')).grid(row=6, column=0)
Label(cock, text='l', font=('Arial')).grid(row=7, column=0)
Label(cock, text='l', font=('Arial')).grid(row=8, column=0)

Label(cock, text=' ∟', font=('Arial')).grid(row=9, column=0)

Label(cock, text='-', font=('Arial')).grid(row=9, column=1)
Label(cock, text='-', font=('Arial')).grid(row=9, column=2)
Label(cock, text='-', font=('Arial')).grid(row=9, column=3)
Label(cock, text='-', font=('Arial')).grid(row=9, column=4)
Label(cock, text='-', font=('Arial')).grid(row=9, column=5)
Label(cock, text='-', font=('Arial')).grid(row=9, column=6)
Label(cock, text='-', font=('Arial')).grid(row=9, column=7)
Label(cock, text='-', font=('Arial')).grid(row=9, column=8)
Label(cock, text='-', font=('Arial')).grid(row=9, column=9)


Label(cock, text='╲', font=('Arial')).grid(row=1, column=1)
Label(cock, text='╲', font=('Arial')).grid(row=2, column=2)
Label(cock, text='╲', font=('Arial')).grid(row=3, column=3)
Label(cock, text='╲', font=('Arial')).grid(row=4, column=4)
Label(cock, text='╲', font=('Arial')).grid(row=5, column=5)
Label(cock, text='╲', font=('Arial')).grid(row=6, column=6)
Label(cock, text='╲', font=('Arial')).grid(row=7, column=7)
Label(cock, text='╲', font=('Arial')).grid(row=8, column=8)
Label(cock, text='╲', font=('Arial')).grid(row=8, column=8)

penis.mainloop()
