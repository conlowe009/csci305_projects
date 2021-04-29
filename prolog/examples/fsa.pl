final(s3).

trans(s1, a, s1).
trans(s1, a, s2).
trans(s1, b, s1).
trans(s2, b, s3).
trans(s3, b, s4).

silent(s2, s4).
silent(s3, s1).

%accept any string if S is the final state (s3)
	accepts(S, []) :- final(S).

%A non-empty string is accepted from a state S if reading the first symbol
%in the string can bring the automaton into some state S1, and the rest 
%of the string is accepted from S1
	accepts(S, [X | Rest]) :- trans(S,X, S1), accepts(S1, Rest).

%A string is accepted from a state S if the automaton can make a silent
%move from S to S1 and then accept the input string from S1. 
	accepts(S, String) :- silent(S, S1), accepts(S1, String).

