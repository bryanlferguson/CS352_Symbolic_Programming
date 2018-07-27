#========================= Task 1 =========================#

def part(L, lower, upper):
	pivot = lower
	i = lower - 1
	for i in range (lower, upper):
		if L[i] <= L[upper]:
			L[i],L[pivot] = L[pivot],L[i]
			pivot += 1
	L[pivot], L[upper] = L[upper], L[pivot]
	return pivot

def  nquicksort (L, lower, upper):
	if lower < upper:
		index = part(L, lower, upper)
		nquicksort(L, lower, index - 1)
		nquicksort(L, index + 1, upper)
		
def quicksort (L):
	nquicksort(L, 0, len(L) - 1)
	
L = [50, 25, 67, 38, 19, 50, 38, 73, 22, 25, 50]
quicksort(L)
print(L)

'''
Output:

[19, 22, 25, 25, 38, 38, 50, 50, 50, 67, 73]
'''


#========================= Task 2 =========================#

def nsumsq(n, result):
	if len(n) == 0:
		return result
	return nsumsq(n[1:], n[0]**2 + result)
	
def sumsq(n):
	return nsumsq(n, 0)
	
L = [1, 5, 2, 4, 9]
print (sumsq(L))

'''
Output:

127
'''

#========================= Task 3 =========================#

def nreverse(s, result):
	if len(s) == 0:
		return result
	return nreverse(s[1:], s[0] + result)
	
def reverse(s):
	return nreverse(s, "")
	
print(reverse("abc"))
print(reverse("hello, looking backwards!"))

'''
Output:

cba
!sdrawkcab gnikool ,olleh
'''