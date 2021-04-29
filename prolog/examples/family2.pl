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
