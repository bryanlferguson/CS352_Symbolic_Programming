/*===================== Task 1 =====================*/

element_at(X,[X|_],1):- !.
element_at(X,[_|L],K) :-
	K > 1,
	KK is K - 1,
	element_at(X,L,KK).
	
/*===================== Task 2 =====================*/

num_elements(0,[]).
num_elements(L, [_|T]) :-
	num_elements(LL, T),
	L is 1 + LL.

/*===================== Task 3 =====================*/

my_flatten([], []):- !.
my_flatten([H|T], X) :-
	!,
	my_flatten(H, L1),
	my_flatten(T, L2),
	append(L1, L2, X).
my_flatten(L, [L]).

/*===================== Task 4 =====================*/
	
range(Upper,Upper,[Upper]) :-!.
range(Lower, Upper, X):-
	Lower < Upper,
	New is Lower + 1,
	range(New, Upper, X1),
	append([Lower], X1, X).
	
/*
Output:
----------------Task 1----------------
?- element_at(X,[a,b,c,d,e],3).
X = c.

?- element_at(X,[a,b,c,d,e],5).
X = e.

?- element_at(X,[a,b,c,d,e],0).
false.

----------------Task 2----------------

?- num_elements(N, [1,2,3,4,5,6,7,8,9,0]).
N = 10.

?- num_elements(N, []).
N = 0.

?- num_elements(N, [a,b,c,d]).
N = 4.

?- num_elements(N, [d]).
N = 1.

----------------Task 3----------------

?- my_flatten([a, [b, [c, d], e]], X).
X = [a, b, c, d, e].

?- my_flatten([[a],[b,[c,d]],[],[e],f], X).
X = [a, b, c, d, e, f].

?- my_flatten([a,[[[]]], [b],[[c]]], X).
X = [a, b, c].

?- my_flatten([], X).
X = [].

?- range(-3,-3,L).
L = [-3].

----------------Task 4----------------

?- range(4,9,L).
L = [4, 5, 6, 7, 8, 9].

?- range(200,208,L).
L = [200, 201, 202, 203, 204, 205, 206, 207, 208].

?- range(-10,-3, L).
L = [-10, -9, -8, -7, -6, -5, -4, -3].

*/
	