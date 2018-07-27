/*===================== Task 1 =====================*/

bmi(_, 0, 0) :- !.

bmi(W, H, B) :-
	B is (W / (H * H)) * 703.

pair(A, B, X, Y) :-
	A >= B, 
	X is A - B, Y is A * B.

pair(A, B, X, Y) :-
	A < B,
	X is A + B, Y is A / B.
	
/*===================== Task 2 =====================*/

has(jack, apples).
has(jack, money).
has(ann, plums).
has(dan, money).
fruit(apples).
fruit(plums).

happy(bill).
happy(mary).
happy(john).
happy(alex).
sad(bill).
likes(john, corvettes).
likes(john,wine).
likes(john,book).
likes(mary, book).
likes(mary, corvettes).
likes(alex,corvettes).

smart(X) :- 
	likes(X, book).
	
valuable(X) :-
	likes(mary, X).

/**
Output:
------------------TASK 1------------------
?- bmi(0,0,B).
B = 0.

?- bmi(100,60,B).
B = 19.527777777777775.

?- bmi(150,72,B).
B = 20.341435185185187.

?- bmi(215,68,X).
X = 32.68706747404844.

?- pair(5,3,X,Y).
X = 2,
Y = 15

?- pair(3,5,X,Y).
X = 8,
Y = 0.6.

------------------TASK 2------------------

?- has(jack,X).
X = apples ;
X = money.

?- has(X, apples), has(Y, plums).
X = jack,
Y = ann.

?- has(dan, X), fruit(X).
false.

?- has(X,Y), not(fruit(Y)).
X = jack,
Y = money ;
X = dan,
Y = money.

?- happy(X).
X = bill ;
X = mary ;
X = john ;
X = alex.

?- likes(X, book).
X = john ;
X = mary.

?- smart(X).
X = john ;
X = mary.

?- valuable(X).
X = book ;
X = corvettes.

?- happy(X), sad(X).
X = bill ;
false.

?- happy(X), likes(X, book).
X = mary ;
X = john ;
false.

*/

