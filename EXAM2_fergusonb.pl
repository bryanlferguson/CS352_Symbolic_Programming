spec(comp1, pc, 32).  
spec(comp2, mac, 128).                                    
spec(comp3, pc, 64).                                       
runs(pc, movie_edit, 96).
runs(pc, vb, 16).                                          
runs(pc, cpp, 28).                                         
runs(mac, vb, 24).                                         
runs(mac, prolog, 128).                                    
access(judy, comp1).             
access(peter, comp3).                                      
access(david, comp1).                                      
access(david, comp2).             

can_use(P, SW) :- 
	access(P, C),
	spec(C, S, M),
	can_run(S, M, SW).
	
can_run(T, M, SW) :-
	runs(T, SW, Memory),
	Memory =< M.

/*
Output:

?- can_use(david, prolog).
true.

?- can_use(judy, SW).
SW = vb ;
SW = cpp.

?- can_use(P, movie_edit).
false.
*/

double([], []).
double([H|T], L) :-
	Z is H * 2,
	double(T, L1),
	L = [Z|L1].

sedo([], []).
sedo([H|T], L) :-
	Z is mod(H, 2),
	Z = 1,
	sedo(T, L), !.
sedo([H|T], [Hl|Tl]) :-
	Z is H*H,
	Hl = Z,
	sedo(T, Tl), !.
	
double_no_recursion(L, R) :-
	maplist(double_element, L, R).
	
sedo_no_recursion(L, R) :-
	include(iseven, L, L1),
	maplist(multiply, L1, L1, R).
	
iseven(X) :- 
	L is X mod 2,
	L == 0.
	
double_element(X, Y) :-
	Y is X * 2.
	
multiply(X, Y, Z) :-
	Z is X * Y.
	
/*
Output:

?- double([2, 5, 4, 6 , 3], L).
L = [4, 10, 8, 12, 6].

?- sedo([2, 5, 4, 6, 3], L).
L = [4, 16, 36].

?- double_no_recursion([2, 5, 4 ,6, 3], L).
L = [4, 10, 8, 12, 6].

?- sedo_no_recursion([2, 5, 4 ,6, 3], L).
L = [4, 16, 36].

*/

purchase(I, _, _, 0, 0) :-
	I < 0, !.
purchase(_, I, _, 0, 0) :-
	I < 0, !.
purchase(_, _, I, 0, 0) :-
	I < 0, !.	
purchase(ItemCost, NumItems, TaxRate, TaxPaid, TotalCost) :-
	ActualTax is TaxRate / 100,
	SubTotal is ItemCost * NumItems,
	TaxPaid is SubTotal * ActualTax,
	TotalCost is TaxPaid + SubTotal.

/*
Output:

?- purchase(2.5, 3, 10, TP, TC).
TP = 0.75,
TC = 8.25.

?- ["EXAM2_fergusonb.pl"].
true.

?- purchase(2.5, 3, 10, TP, TC).
TP = 0.75,
TC = 8.25.

?- purchase(15.2, 35, 9.5, TP, TC).
TP = 50.54,
TC = 582.54.

?- purchase(-3, 3, 9, TP, TC).
TP = TC, TC = 0.

?- purchase(3, -1, 8, TP, TC).
TP = TC, TC = 0.

?- purchase(5, 4, -2.5, TP, TC).
TP = TC, TC = 0.

*/

random_even(Result) :-
	random(1, 10, X),
	Result is X * 2.
random_odd(Result) :-
	random(0, 9, X),
	Result is X * 2 + 1.
gen(X, L) :-
	generate_interleaving(0, X, L).
generate_interleaving(_,0,[]):- !.
generate_interleaving(Counter, X, Result) :-
	O is Counter mod 2,
	O == 1,
	C1 is Counter + 1,
	X1 is X - 1,
	random_odd(R),
	generate_interleaving(C1, X1, R1),
	append([R], R1, Result), !.
generate_interleaving(Counter, X, Result) :-
	O is Counter mod 2,
	O == 0,
	X1 is X - 1,
	C1 is Counter + 1,
	random_even(R),
	generate_interleaving(C1, X1, R1),
	append([R], R1, Result), !.
	
/*Assuming you wanted values between (0, 10) and not (0,1).*/
fivebyfive() :-
	generate_matrix(5,5,L),
	write(L).
	
generate_matrix(0, _, []):-!.
generate_matrix(Counter, X, L) :-
	C1 is Counter - 1,
	generate_list(X, L1),
	generate_matrix(C1, X, L2),
	L = [L1|L2].
	
generate_list(0, []) :- !.
generate_list(X, L) :-
	C1 is X - 1,
	random(1, 10, R),
	generate_list(C1, L1),
	L = [R|L1].
	
/*Assuming number of cubes desired is given */
generate_cubes(0, []):-!.
generate_cubes(X, L) :-
	X1 is X - 1,
	Cube is X * X * X,
	generate_cubes(X1, L1),
	append(L1, [Cube], L).
	
/*
Output:

?- gen(7, L).
L = [4, 15, 6, 1, 16, 15, 14].

?- gen(10, L).
L = [10, 13, 6, 3, 16, 5, 4, 11, 14|...].

?- fivebyfive().
[[5,5,8,6,2],[2,6,6,6,3],[4,1,8,3,4],[5,9,4,9,1],[1,1,3,6,6]]
true.

?- generate_cubes(5, L).
L = [1, 8, 27, 64, 125].

?- generate_cubes(7, L).
L = [1, 8, 27, 64, 125, 216, 343].

*/

my_flatten([], []):- !.
my_flatten([H|T], X) :-
	!,
	my_flatten(H, L1),
	my_flatten(T, L2),
	append(L1, L2, X).
my_flatten(L, [L]).

samefreq([],[],_):-!.
samefreq(L1, L2, X) :-
	my_flatten(L1, L3),
	my_flatten(L2, L4),
	frequency(L3, X, F1),
	frequency(L4, X, F2),
	F1 == F2, !.

frequency([], _, 0) :-!.
frequency([H|T], X, C) :-
	frequency(T, X, NewC),
	\+ X == H,
	C is NewC, !.
frequency([H|T], X, C) :-
	frequency(T, X, NewC),
	H == X,
	C is NewC + 1, !.
	
/*
Output: 

?- samefreq([a,a, [a,a,b], c, [c,a,[a,d],e],e,e,e], [b,b,[a,c,a,a,a],[d,[a,a],e],e], a).
true.

?- samefreq([a,a,a,[a,b,c,c],a,a,d,e,e,e,e], [b,[b,a,[c,a,a,a,d],a,a],e,e], b).
false.

?- samefreq([],[],c).
true.

*/	


	