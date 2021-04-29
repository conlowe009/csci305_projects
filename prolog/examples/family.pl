family(

person(john, fox, date(7, may, 1950), works(msu, 15200)), 

person(ann, fox, date(9, may, 1955), works(ilx, 52000)), 

[
person(pat, fox, date(5, may, 1994), unemployed), 
person(joey, fox, date(10, october, 1999), unemployed)

]

).

husband(X) :- family(X, _, _).

wife(X) :- family(_, X, _).

