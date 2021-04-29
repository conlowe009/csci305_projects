snow(

river(bd, fx, canopy(7, zone), fur(sig, 15)),

river(at, fx, canopy(9, zone), fur(zap, 52)),

[
river(pt, fx, canopy(5, zone), dew),
river(jt, fx, canopy(10, section), dew)

]

).

late(X) :- snow(X, _, _).

early(X) :- snow(_, X, _).

onTime(X) :- 
  snow(_,_,C),
  member(X, C).

exists(P) :- late(P); early(P); onTime(P).

first(river(_,_,Dt, _), Dt).
second(river(_,_,_,canopy(_, S)), S).
second(river(_,_,_,dew), 0).

