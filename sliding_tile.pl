% 15 - SLIDING TILE PUZZLE %

% Valid moves for the puzzle
left(State,Goal):-
  createList(State,L1),
  getIndex(L1,0,I1),
  isLeftValid(I1),
  NewSpace is I1 - 1,
  getElement(Num,L1,NewSpace),
  delete(L1,0,L2),delete(L2,Num,L3),
  elementInsert(0,L3,I1-1,L4),elementInsert(Num,L4,I1,List),
  stateOf(List,Goal).

right(State,Goal):-
  createList(State,L1),
  getIndex(L1,0,I1),
  isRightValid(I1),
  NewSpace is I1 + 1,
  getElement(Num,L1,NewSpace),
  delete(L1,0,L2),delete(L2,Num,L3),
  elementInsert(Num,L3,I1,L4),elementInsert(0,L4,I1+1,List),
  stateOf(List,Goal).

up(State,Goal):-
  createList(State,L1),
  getIndex(L1,0,I1),
  isUpValid(I1),
  NewSpace is I1 - 4,
  getElement(Num,L1,NewSpace),
  delete(L1,0,L2),delete(L2,Num,L3),
  elementInsert(0,L3,I1-4,L4),elementInsert(Num,L4,I1,List),
  stateOf(List,Goal).

down(State,Goal):-
  createList(State,L1),
  getIndex(L1,0,I1),
  isDownValid(I1),
  NewSpace is I1 + 4,
  getElement(Num,L1,NewSpace),
  delete(L1,0,L2),delete(L2,Num,L3),
  elementInsert(Num,L3,I1,L4),elementInsert(0,L4,I1+4,List),
  stateOf(List,Goal).

% Validation Check
isLeftValid(Space):-X is mod(Space,4), X \= 1.
isRightValid(Space):-X is mod(Space,4), X \= 0.
isUpValid(Space):-rangeofH(1,4,L),not(member(Space,L)).
isDownValid(Space):-X is (1+(4 * (4-1))),Y is (4 * 4),rangeofH(X,Y,L),not(member(Space,L)).

% Move function
move(State,Child):-left(State,Child).
move(State,Child):-up(State,Child).
move(State,Child):-right(State,Child).
move(State,Child):-down(State,Child).

% Calculate Horizontal Range
rangeofH(First,First,[First]).
rangeofH(First,Last,[First|L]) :- First < Last, Next is First + 1,rangeofH(Next,Last,L).

% Delete an element at given position
deleteAt(X,[X|Xs],1,Xs).
deleteAt(X,[Y|Xs],K,[Y|Ys]) :- K > 1,
   K1 is K - 1, deleteAt(X,Xs,K1,Ys).

% Insert an element at given position
elementInsert(X,L,K,R) :- deleteAt(X,R,K,L).

% Retreive an element at given position
getElement(X,[X|_],1).
getElement(X,[_|L],K) :- K > 1, K1 is K - 1, getElement(X,L,K1).

stateOf([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],A/B/C/D/E/F/G/H/I/J/K/L/M/N/O/P).

createList(A/B/C/D/E/F/G/H/I/J/K/L/M/N/O/P,List):- List = [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P].

% Return the index of given element
getIndex([Element|_], Element,1):- !.
getIndex([_|Tail], Element, Index):-
  getIndex(Tail, Element, Index1),
  !,
  Index is Index1+1.

% Heuristic function
heuristic(State,Goal,H):- 
  getManhattanDistance(State,Goal,D),     
  H is D.
                      
% Calculate Manhattan distance 
getManhattanDistance(State,Goal,D):-createList(State,L1),createList(Goal,L2),mdist(L1,L1,L2,D).

mdist([],_,_,0).
mdist([X|Xs],S,G,D):-(X\=0 -> getIndex(S,X,I1),getIndex(G,X,I2),mnhtDist(I1,I2,D1),mdist(Xs,S,G,D2),D is D1 + D2; D1 = 0,mdist(Xs,S,G,D2),D is D1 + D2).

mandistance(X/Y,X1/Y1,D):-
  dif(X,X1,Dx),
  dif(Y,Y1,Dy),
  D is Dx + Dy,
  D>=0.

dif(A,B,D) :-
  D is A - B,
  D >= 0.
dif(A,B,D) :-
  D is B - A,
  D > 0.

mnhtDist(Space1,Space2,D):-
  getx(Space1,X1),
  gety(Space1,Y1),
  getx(Space2,X2),
  gety(Space2,Y2),
  mandistance(X1/Y1,X2/Y2,D).

%  Return value of X
getx(P,X):- M is mod(P,4), M=0, X is 4,!.
getx(P,X):- X is mod(P,4).

% Return value of Y
gety(P,Y):- M is mod(P,4), M=0, Y is P/4,!.
gety(P,Y):- Y is truncate(P/4+1).

cost(_, _, C) :-
    C is 1.
