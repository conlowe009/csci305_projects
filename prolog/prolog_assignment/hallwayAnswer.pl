% Initial logical setup for the bedrooms
bedrooms([sleeps(_,1), sleeps(_,2), sleeps(_,3), sleeps(_,4), sleeps(_,5)]).

% Function for the rule that Arnie cannot be next to Addiley or Laura
not_adjacent(X,Y,Z) :- X =\= Y+1, X=\= Y-1, X =\= Z+1, X =\= Z-1.

% Function that allows Ramey to be a room greater than Laura
room_greater(U,V) :- U > V. 

% Determines which person goes into which room with additional logic predefined
which_person(W) :- bedrooms(W),
      % Hunter cannot be in room 5
      member(sleeps(hunter, A), W), A\=5,

      % Laura cannot be in room 1 
      member(sleeps(laura, B), W), B\=1,

      % No particular rules for these members
      member(sleeps(addiley, C), W),
      member(sleeps(ramey, D), W),

      % Arnie cannot be in room 1 or 5
      member(sleeps(arnie, E), W), E\=1, E\=5,

      % Logic functions from earlier 
      not_adjacent(E,C,B),
      room_greater(D,B).
