#========================= Task 1 =========================#

def compareA(a, b):
	return a > b
	
def compareB(a, b):
	return a[0] < b[0]
	
def compareC(a, b):
	if a[1] == b[1]:
		return a[0] < b[0]
	return a[1] > b[1]
	
	
def part(L, lower, upper, func):
	pivot = lower
	i = lower - 1
	for i in range (lower, upper):
		if func(L[i], L[upper]):
			L[i],L[pivot] = L[pivot],L[i]
			pivot += 1
	L[pivot], L[upper] = L[upper], L[pivot]
	return pivot

def  nquicksort (L, lower, upper, func):
	if lower < upper:
		index = part(L, lower, upper, func)
		nquicksort(L, lower, index - 1, func)
		nquicksort(L, index + 1, upper, func)
		
def quicksort (L, func):
	nquicksort (L, 0, len(L) - 1, func)
		
L1 = [1, 4, 2, 9, 5] 
L2 = [["maria", 78], ["ted", 65], ["alex",  70], ["kimmy", 90], ["ben", 81]]
L3 = [["maria", 78], ["ted", 65], ["alex",  70], ["kimmy", 90], ["ben", 81], ["ken", 78], ["john", 70]]
quicksort(L1, compareA)
quicksort(L2, compareB)
quicksort(L3, compareC)

print(L1)
print(L2)
print(L3)

'''
Output:

[9, 5, 4, 2, 1]
[['alex', 70], ['ben', 81], ['kimmy', 90], ['maria', 78], ['ted', 65]]
[['kimmy', 90], ['ben', 81], ['ken', 78], ['maria', 78], ['alex', 70], ['john', 70], ['ted', 65]]
'''

#========================= Task 2 =========================#

def ACC_SOME(L, test, base_val, fn, acc_op):
	if len(L) == 0:
		return base_val
	elif test(L[0]):
		return acc_op(fn(L[0]), ACC_SOME(L[1:], test, base_val, fn, acc_op))
	else:
		return ACC_SOME(L[1:], test, base_val, fn, acc_op)		
	
isOdd = lambda x: x & 1 == 1
isNum = lambda x: type(x) == int
add = lambda x, y: x + y
one = lambda x: 1
sum = lambda x: x

def COUNT_ODD(L):
	return ACC_SOME(L, isOdd, 0, one, add)

def SUM_ODD(L):
	return ACC_SOME(L, isOdd, 0, sum, add)

def COUNT_NUM(L):
	return ACC_SOME(L, isNum, 0, one, add)

def SUM_NUM(L):
	return ACC_SOME(L, isNum, 0, sum, add)
	
L=[3, 1, 4, 1]
L2=['A', 1, 2, 'B' ,3] 

print(COUNT_ODD(L))
print(SUM_ODD(L))
print(COUNT_NUM(L2))
print(SUM_NUM(L2))

'''
Output:

3
5
3
6
'''