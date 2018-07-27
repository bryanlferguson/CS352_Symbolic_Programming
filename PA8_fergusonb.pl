/*Random number generators*/
random_generator(0, _, _, []):-!.
random_generator(N, Lower, Upper, L):-
	N > 0,
	N1 is N - 1,
	random(Lower, Upper, X),
	random_generator(N1, Lower, Upper, L1),
	L = [X|L1].
	
generate_100_random_integers(L):-
	random_generator(100, 0, 100, L).
generate_50_random_floats(L):-
	random_generator(50,0.0,100.0,L).

/*Outputting lists of numbers*/
write_formatted_integers([],_):-!.
write_formatted_integers(L, 0) :-
	nl,
	write_formatted_integers(L, 10),!.
write_formatted_integers([H|T], N) :-
	write(H),
	write(" "),
	N1 is N - 1,
	write_formatted_integers(T, N1),!.

write_formatted_float([],_):-!.
write_formatted_float(L, 0) :-
	nl,
	write_formatted_float(L, 10),!.
write_formatted_float([H|T], N) :-
	format('~2f', H),
	write(" "),
	N1 is N - 1,
	write_formatted_float(T, N1),!.

write_list([H|T]) :-
	integer(H),
	L1 = [H|T],
	write_formatted_integers(L1, 10),!.

write_list([H|T]) :-
	float(H),
	L1 = [H|T],
	write_formatted_float(L1, 10),!.

/*Merge sort implementation*/	
my_split([],[],[]).
my_split([X],[X],[]).
my_split([X,Y|Z],[X|XS],[Y|YS]) :-
	my_split(Z,XS,YS).
	
merge(X, [], X).
merge([], X, X).
merge([H1|T1], [H2|T2], L) :-
	H1 > H2,
	merge(T1, [H2|T2], L1),
	L = [H1|L1].

merge([H1|T1], [H2|T2], L) :-
	H1 =< H2,
	merge([H1|T1], T2, L1),
	L = [H2|L1].
	
merge_sort([], []).
merge_sort([H],[H]).
merge_sort([H1,H2],[H1,H2]) :-
	H1 > H2.
merge_sort([H1,H2],[H2,H1]) :-
	H1 =< H2.
merge_sort(X, L) :-
	my_split(X, L1, L2),
	merge_sort(L1, R1),
	merge_sort(L2, R2),
	merge(R1,R2,L).

/*Method to output all required output*/
output_all():-
	write("100 Random Integers:"),
	nl,
	generate_100_random_integers(L1), write_list(L1),
	nl, nl,
	write("Sorted 100 Random Integers:"),
	nl,
	merge_sort(L1, S1), write_list(S1),
	nl, nl,
	write("50 Random Formatted Floats:"),
	nl,
	generate_50_random_floats(L2), write_list(L2),
	nl,nl,
	write("Sorted 50 Random Floats:"),
	nl,
	merge_sort(L2, S2), write_list(S2),!.

/* 
Sample output 1:

?- output_all().
100 Random Integers:
71 13 59 45 15 14 31 31 25 61
87 39 85 59 4 74 9 97 36 81
74 30 75 59 92 48 79 95 88 77
91 29 3 84 82 16 81 7 97 71
35 78 11 14 2 92 21 99 32 9
44 12 21 97 26 70 13 17 87 12
72 45 46 4 11 44 91 68 15 41
96 83 61 78 78 6 5 77 17 20
87 28 55 21 45 81 38 53 22 16
96 44 10 46 91 61 38 53 26 58

Sorted 100 Random Integers:
99 97 97 97 96 96 95 92 92 91
91 91 88 87 87 87 85 84 83 82
81 81 81 79 78 78 78 77 77 75
74 74 72 71 71 70 68 61 61 61
59 59 59 58 55 53 53 48 46 46
45 45 45 44 44 44 41 39 38 38
36 35 32 31 31 30 29 28 26 26
25 22 21 21 21 20 17 17 16 16
15 15 14 14 13 13 12 12 11 11
10 9 9 7 6 5 4 4 3 2

50 Random Formatted Floats:
13.52 45.02 57.80 79.59 8.11 46.53 39.15 15.62 75.19 72.11
27.12 13.92 30.14 40.27 16.33 89.16 1.59 23.09 54.64 47.36
55.80 84.34 20.11 49.12 73.77 81.37 96.10 15.33 73.39 14.25
31.97 1.11 88.36 62.83 82.69 39.74 55.44 64.83 81.35 88.98
73.76 28.54 88.02 72.10 89.13 15.32 4.76 29.65 0.45 98.57

Sorted 50 Random Floats:
98.57 96.10 89.16 89.13 88.98 88.36 88.02 84.34 82.69 81.37
81.35 79.59 75.19 73.77 73.76 73.39 72.11 72.10 64.83 62.83
57.80 55.80 55.44 54.64 49.12 47.36 46.53 45.02 40.27 39.74
39.15 31.97 30.14 29.65 28.54 27.12 23.09 20.11 16.33 15.62
15.33 15.32 14.25 13.92 13.52 8.11 4.76 1.59 1.11 0.45
true.

Sample output 2:

?- output_all().                                                                100 Random Integers:
0 18 18 34 28 72 18 62 53 63
32 5 94 27 87 71 45 59 18 95
16 94 57 56 70 1 94 52 87 42
92 58 30 53 2 76 21 3 36 23
16 32 53 72 15 89 27 20 66 86
24 94 68 3 50 4 7 50 15 94
33 88 57 55 95 4 59 58 73 63
81 30 87 52 52 71 37 25 75 93
94 33 11 92 53 45 32 65 31 89
64 23 7 77 37 79 24 54 8 25

Sorted 100 Random Integers:
95 95 94 94 94 94 94 94 93 92
92 89 89 88 87 87 87 86 81 79
77 76 75 73 72 72 71 71 70 68
66 65 64 63 63 62 59 59 58 58
57 57 56 55 54 53 53 53 53 52
52 52 50 50 45 45 42 37 37 36
34 33 33 32 32 32 31 30 30 28
27 27 25 25 24 24 23 23 21 20
18 18 18 18 16 16 15 15 11 8
7 7 5 4 4 3 3 2 1 0

50 Random Formatted Floats:
0.10 89.83 17.28 89.57 51.38 53.20 63.56 97.38 7.97 12.12
88.97 46.65 34.00 3.05 73.68 48.17 56.47 39.66 10.12 43.88
7.38 94.62 1.05 41.51 43.81 78.98 84.14 14.47 51.68 13.27
54.72 15.77 65.29 45.63 77.32 23.10 11.68 99.75 55.85 6.20
9.00 3.80 8.14 32.20 47.37 96.44 89.75 37.99 50.13 39.32

Sorted 50 Random Floats:
99.75 97.38 96.44 94.62 89.83 89.75 89.57 88.97 84.14 78.98
77.32 73.68 65.29 63.56 56.47 55.85 54.72 53.20 51.68 51.38
50.13 48.17 47.37 46.65 45.63 43.88 43.81 41.51 39.66 39.32
37.99 34.00 32.20 23.10 17.28 15.77 14.47 13.27 12.12 11.68
10.12 9.00 8.14 7.97 7.38 6.20 3.80 3.05 1.05 0.10
true.

*/
	
	
	
	
	


