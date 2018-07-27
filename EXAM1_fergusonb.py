#========================= Problem 1 =========================#

import random

def sumNCubes(num):
	sum = 0
	for i in range (1, num + 1):
		sum += i**3
	return sum

def sumNRand(n, m):
	sum = 0
	for i in range (1, n + 1):
		sum += random.randint(1,m)
	return sum
	
print(sumNCubes(3))
print(sumNCubes(5))
print(sumNRand(3,10))
print(sumNRand(5,100))

'''
Output:
36
225
27
200
'''


#========================= Problem 2 =========================#

def digitToEng(n):
	if n == "0":
		return "Zero"
	if n == "1":
		return "One"
	if n == "2":
		return "Two"
	if n == "3":
		return "Three"
	if n == "4":
		return "Four"
	if n == "5":
		return "Five"
	if n == "6":
		return "Six"
	if n == "7":
		return "Seven"
	if n == "8":
		return "Eight"
	if n == "9":
		return "Nine"
		
def numberToEngHelp(n, result):
	if len(str(n)) == 0:
		return result
	return numberToEngHelp(n[1:], result + digitToEng(n[0]) + " " )
	
def numberToEnglish(n):
	return numberToEngHelp(str(n), "")
	
print(numberToEnglish(7))
print(numberToEnglish(153))
print(numberToEnglish(8256))

'''
Output:
Seven
One Five Three
Eight Two Five Six
'''


#========================= Problem 3 =========================#

def powerTailRecursion(x, n, result): 
	if n < 1: 
		return result
	return powerTailRecursion(x, n - 1, result * x)
	
def power(x, n):
	return powerTailRecursion(x, n, 1)
	
print(power(2, 4))
print(power(5, 3))

'''
Output:
16
125
'''


#========================= Problem 4 =========================#

def doubleEachElement(L):
	return list(map(lambda x: x * 2, L))
	
def doubleOddsRemoveEvens(L):
	return list(map(lambda x: x * 2, list(filter(lambda x: x & 1, L))))
	
L = [10, 19, 20, 43, 25, 30, 31, 71, 42, 17, 15]
print(doubleEachElement(L))
print(doubleOddsRemoveEvens(L))

'''
Output:
[20, 38, 40, 86, 50, 60, 62, 142, 84, 34, 30]
[38, 86, 50, 62, 142, 34, 30]
'''

#========================= Problem 5 =========================#

def desc(a, b):
	return a < b
	
def ascSecond(a, b):
	return a[1] > b[1]


def insertionSort(alist, func):
	for index in range(1,len(alist)):
		currentvalue = alist[index]
		position = index

		while position>0 and func(alist[position-1],currentvalue):
			alist[position]=alist[position-1]
			position = position-1
			
		alist[position]=currentvalue	

		
L = [54, 26, 93, 17, 77, 31, 44, 55, 20]
insertionSort(L, desc)
print(L)

L2 = [["candy", 54],["choc", 26], ["drinks", 93], ["cake", 17], ["bagel",77], ["ice-cream", 31], ["beer",44], ["fruits",55], ["fries",20]]
insertionSort(L2, ascSecond)
print(L2)

'''
Output:
[93, 77, 55, 54, 44, 31, 26, 20, 17]
[['cake', 17], ['fries', 20], ['choc', 26], ['ice-cream', 31], ['beer', 44], ['candy', 54], ['fruits', 55], ['bagel', 77], ['drinks', 93]]
'''

