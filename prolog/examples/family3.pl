family(
person(tom, fox, date(7, may, 1950), works(msu, 15200)), 
person(ann, fox, date(9, may, 1955), works(ilx, 52000)), 
[person(pat, fox, date(5, may, 1994), unemployed), 
person(joey, fox, date(10, october, 1999), unemployed)]).

family(person(john, askew, date(17, april, 1968), works(msu, 42000)),
        person(mary, askew, date(29, september, 1967), unemployed),
        []
      ).

family(
        person(hunter, lloyd, date(5, may, 1966), works(msu, 500)),
        person(laura, lloyd,  date(11, june, 1976), unemployed),
        [
                person(ramey, lloyd, date(4, october, 2003), unemployed)
        ]
  ).

husband(X) :- family(X, _, _).

child(X) :- 
  family(_,_,Children),
  member(X, Children).

wife(X) :- family(_,X,_).

member(X, [X | L]).

member(X, [Y | L]) :- member(X,L).

exists(Person) :- husband(Person); wife(Person); child(Person).

dateofbirth(person(_,_,Date, _), Date).
salary(person(_,_,_,works(_, S)), S).
salary(person(_,_,_,unemployed), 0).

