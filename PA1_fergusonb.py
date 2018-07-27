import math

'''
====================== TASK 1 ====================== 
'''

##
#  Computes the number of tiles needed and the gap at each end when
#  placing tiles along a wall.
#

# Define the dimensions.
totalWidth = 100
tileWidth = 5

# Calculate the tiles and gaps.
numberOfPairs = (totalWidth - tileWidth) // (2 * tileWidth)
numberOfTiles = 1 + 2 * numberOfPairs
gap = (totalWidth - numberOfTiles * tileWidth) / 2.0

print("Number of tiles:", numberOfTiles)
print("Gap at each end:", gap)

'''
Output: 
Number of tiles: 19
Gap at each end: 2.5
'''

##
#  Sample program that demonstrates the print function.
#

# Prints 7.
print(3 + 4) 
      
# Prints "Hello World!" in two lines.
print("Hello") 
print("World!")

# Prints multiple values with a single print function call.
print("My favorite numbers are", 3 + 4, "and", 3 + 10) 

# Prints three lines of text with a blank line.
print("Goodbye")   
print()
print("Hope to see you again")

'''
Output: 
7
Hello
World!
My favorite numbers are 7 and 13
Goodbye

Hope to see you again
'''

##
#  This program computes income taxes, using a simplified tax schedule.
#

# Initialize constant variables for the tax rates and rate limits.
RATE1 = 0.10
RATE2 = 0.25
RATE1_SINGLE_LIMIT = 32000.0
RATE1_MARRIED_LIMIT = 64000.0     

# Read income and marital status     
income = float(input("Please enter your income: "))
maritalStatus = input("Please enter s for single, m for married: ")

# Compute taxes due.
tax1 = 0
tax2 = 0

if maritalStatus == "s" :
   if income <= RATE1_SINGLE_LIMIT :
      tax1 = RATE1 * income
   else :
      tax1 = RATE1 * RATE1_SINGLE_LIMIT
      tax2 = RATE2 * (income - RATE1_SINGLE_LIMIT)
else :
   if income <= RATE1_MARRIED_LIMIT :
      tax1 = RATE1 * income
   else : 
      tax1 = RATE1 * RATE1_MARRIED_LIMIT
      tax2 = RATE2 * (income - RATE1_MARRIED_LIMIT)
          
totalTax = tax1 + tax2

# Print the results.
print("The tax is $%.2f" % totalTax)


''' 
Test data 1: 

Please enter your income: 1234
Please enter s for single, m for married: s
The tax is $123.40

Test data 2: 

Please enter your income: 250000
Please enter s for single, m for married: m
The tax is $52900.00
'''


'''
====================== TASK 2 ====================== 
'''

leg1 = int(input("Enter value for leg 1:"))
leg2 = int(input("Enter value for leg 2:"))

hypotenuse = math.pow(leg1, 2) + math.pow(leg2, 2)
hypotenuse = math.sqrt(hypotenuse)

print("Hypotenuse is:", hypotenuse)

'''
Test 1:

Enter value for leg 1:3
Enter value for leg 2:4
Hypotenuse is: 5.0

Test 2:

Enter value for leg 1:34
Enter value for leg 2:21
Hypotenuse is: 39.96248240537617

Test 3 (my data):

Enter value for leg 1:5
Enter value for leg 2:12
Hypotenuse is: 13.0

'''


'''
====================== TASK 3 ====================== 
'''

candyprice = float(input("Enter price for pack of candy:"))
numpack = int(input("Enter number of packs to buy:"))
taxrate = float(input("Enter tax rate:"))

subtotal = candyprice * numpack
taxcharged = subtotal * taxrate
totalcost = subtotal + taxcharged

print ("Subtotal: $%.2f"%subtotal)
print ("Tax: $%.2f"%taxcharged)
print ("Total: $%.2f"%totalcost)


'''
Test 1:

Enter price for pack of candy:3
Enter number of packs to buy:2
Enter tax rate:.085
Subtotal: $6.00
Tax: $0.51
Total: $6.51


Test 2: 

Enter price for pack of candy:5.4
Enter number of packs to buy:12
Enter tax rate:.095
Subtotal: $64.80
Tax: $6.16
Total: $70.96

'''