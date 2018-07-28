# CS352_Symbolic_Programming

## Programming Assignment 1

#### Task 1

Run the three sample Python programs (printtest.py, tiles.py and taxes.py) with proper input (for each program test twice). Program files attached.

#### Task 2
Write a program that prompts user to enter two legs of a right triangle and then calculate and output the hypotenuse. Note: use math module, e.g.  

	import math  
	root2 = math.sqrt(2)  
	
Tests: (1) leg1: 3   leg2: 4    (2) leg1: 34   leg2: 21    (3) your own test data

#### Task 3
Write a program that reads in the unit price for a pack of candy, how many packs you’d buy, and tax rate. The program will output the subtotal cost, tax charged, and the total cost.  
Tests: (1) $3 per pack, 2 packs, tax rate 8.5%;  (2) $5.4 per pack, 12 packs, tax rate 9.5%   

## Programming Assignment 2

#### Task 1
The following quicksort traversals the list three or more times (one time for finding smaller, another time for finding equal, third time for finding larger, …). Rewrite the quicksort function to minimize the numbers of going through the whole list.

	def  quicksort (L) :  
		if len(L) <= 1 :  
			return L  
		else :  
			L1 = smaller(L, L[0])  
			L2 = equal(L, L[0])  
			L3 = larger(L, L[0])  
			newL1 = quicksort(L1)  
			newL3 = quicksort(L3)  
			return newL1 + L2 + newL3  
	def smaller(L, a) :  
		size = len(L)  
		if size == 0:  
			return L  
		elif L[0] < a :  
			return [L[0]] + smaller(L[1:size], a)  
		else :  
			return smaller(L[1:size])  
	#equal and larger similar, omitted here  

Test: quicksort of list [50, 25, 67, 38, 19, 50, 38, 73, 22, 25, 50]

#### Task 2
Rewrite the following sumSq function to a tail recursion.

	def sumSq (L) :  
		if len(L) == 0 :  
			return 0  
		else :  
			return L[0]*L[0] + sumSq(L[1:len(L)])  
			
Test: sumSq of list [1, 5, 2, 4, 9]  

#### Task 3 
Write a reverse function that reverses a string in tail recursion fashion. i.e. reverse(“abc”) -> “bca”  
Test: “abc”,  “hello, looking backwards!”

