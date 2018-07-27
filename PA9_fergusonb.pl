/* Prime number generator implementation */
isPrime(X) :-
	isPrimeLoop(2, X).
	
isPrimeLoop(Number, Number):-!.
isPrimeLoop(Counter, Number) :-
	Number mod Counter =\= 0,
	NewC is Counter + 1,
	isPrimeLoop(NewC, Number).

primes(X, []) :-
	X < 2, !.
primes(2, [2]):-!.
primes(X, Result) :-
	X > 2,
	isPrime(X),
	X1 is X - 1,
	primes(X1, T), 
	append(T, [X], Result), !.
primes(X, L) :-
	X > 2,
	not(isPrime(X)),
	X1 is X - 1,
	primes(X1, L), !.

/* Below is for lists too long to be displayed normally */
primes(X):-
	primes(X, L),
	writeList(L).
	
writeList([X]):-
	write(X), !.
writeList([H|T]):-
	write(H),
	write(", "),
	writeList(T).
	
/* 
Output:
?- primes(10, L).
L = [2, 3, 5, 7].

?- primes(11, L).
L = [2, 3, 5, 7, 11].

?- primes(100).
2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97
true.

?- primes(0, L).
L = [].

?- primes(1, L).
L = [].

?- primes(-4, L).
L = [].

?- primes(6, L).
L = [2, 3, 5].

?- primes(2, L).
L = [2].

*/
	
