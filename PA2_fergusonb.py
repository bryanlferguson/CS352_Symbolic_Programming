#========================= Task 1 =========================#

def recreverse(input): 
	if len(input) == 0: 
		return input
	return input[-1:] + recreverse(input[:-1])
	
print (recreverse("RiseToVoteSir"))
print (recreverse("I want to reverse this!"))
print (recreverse("Another reversed string please"))
print (recreverse("This should be the last sample output"))

'''
Output:

riSetoVoTesiR
!siht esrever ot tnaw I
esaelp gnirts desrever rehtonA
tuptuo elpmas tsal eht eb dluohs sihT
'''


#========================= Task 2 =========================#

def recursivepattern(num):
	if num == 0:
		return "0"
	return recursivepattern(num - 1) + " " + str(num) + " " + recursivepattern(num - 1)
	
print("pattern(0): ", recursivepattern(0))
print("pattern(1): ", recursivepattern(1))
print("pattern(2): ", recursivepattern(2))
print("pattern(3): ", recursivepattern(3))
print("pattern(4): ", recursivepattern(4))

'''
Output:

pattern(0):  0
pattern(1):  0 1 0
pattern(2):  0 1 0 2 0 1 0
pattern(3):  0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
pattern(4):  0 1 0 2 0 1 0 3 0 1 0 2 0 1 0 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
'''

#========================= Task 3 =========================#

def ispalindrome(s):
	if len(s) == 1 or len(s) == 0:
		return True
	if s[0] == s[-1]:
		return ispalindrome(s[1:-1])
	return False
	
print (ispalindrome("racecar"))
print (ispalindrome("civic"))
print (ispalindrome("potato"))
print (ispalindrome("risetovotesir"))
print (ispalindrome("recursionisfun"))
print (ispalindrome("madam"))

'''
Sample output:

True
True
False
True
False
True
'''