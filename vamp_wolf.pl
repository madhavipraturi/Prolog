% Checking if the move is safe or not (vamps shouldn't be outnumbered)
valid(Wolf_East,Vamp_East,Wolf_West,Vamp_West) :-
	Vamp_East>=0, Wolf_East>=0, Vamp_West>=0, Wolf_West>=0,
	(Vamp_East>=Wolf_East ; Vamp_East=0),
	(Vamp_West>=Wolf_West ; Vamp_West=0).

% Defining possible moves

% moving 2 vamps from east to west
move([Wolf_East,Vamp_East,Wolf_West,Vamp_West,east],[Wolf_East,VE2,Wolf_West,VW2,west]):-
	VW2 is Vamp_West+2,
	VE2 is Vamp_East-2,
	valid(Wolf_East,VE2,Wolf_West,VW2).
	
% moving 2 wolfs from east to west	
move([Wolf_East,Vamp_East,Wolf_West,Vamp_West,east],[WE2,Vamp_East,WW2,Vamp_West,west]):-
	WW2 is Wolf_West+2,
	WE2 is Wolf_East-2,
	valid(WE2,Vamp_East,WW2,Vamp_West).
	
% moving 1 wolf and 1 vamp from east to west	
move([Wolf_East,Vamp_East,Wolf_West,Vamp_West,east],[WE2,VE2,WW2,VW2,west]):-
	WW2 is Wolf_West+1,
	WE2 is Wolf_East-1,
	VW2 is Vamp_West+1,
	VE2 is Vamp_East-1,
	valid(WE2,VE2,WW2,VW2).
	
% moving 1 vamp from east to west
move([Wolf_East,Vamp_East,Wolf_West,Vamp_West,east],[Wolf_East,VE2,Wolf_West,VW2,west]):-
	VW2 is Vamp_West+1,
	VE2 is Vamp_East-1,
	valid(Wolf_East,VE2,Wolf_West,VW2).
	
% moving 1 wolf from east to west	
move([Wolf_East,Vamp_East,Wolf_West,Vamp_West,east],[WE2,Vamp_East,WW2,Vamp_West,west]):-
	WW2 is Wolf_West+1,
	WE2 is Wolf_East-1,
	valid(WE2,Vamp_East,WW2,Vamp_West).
	
% moving 2 vamps from west to east	
move([Wolf_East,Vamp_East,Wolf_West,Vamp_West,west],[Wolf_East,VE2,Wolf_West,VW2,east]):-
	VW2 is Vamp_West-2,
	VE2 is Vamp_East+2,
	valid(Wolf_East,VE2,Wolf_West,VW2).
	
% moving 2 wolfs from west to east		
move([Wolf_East,Vamp_East,Wolf_West,Vamp_West,west],[WE2,Vamp_East,WW2,Vamp_West,east]):-
	WW2 is Wolf_West-2,
	WE2 is Wolf_East+2,
	valid(WE2,Vamp_East,WW2,Vamp_West).
	
% moving 1 vamp and 1 wolf from west to east	
move([Wolf_East,Vamp_East,Wolf_West,Vamp_West,west],[WE2,VE2,WW2,VW2,east]):-
	WW2 is Wolf_West-1,
	WE2 is Wolf_East+1,
	VW2 is Vamp_West-1,
	VE2 is Vamp_East+1,
	valid(WE2,VE2,WW2,VW2).
	
% moving 1 vamp from west to east	
move([Wolf_East,Vamp_East,Wolf_West,Vamp_West,west],[Wolf_East,VE2,Wolf_West,VW2,east]):-
	VW2 is Vamp_West-1,
	VE2 is Vamp_East+1,
	valid(Wolf_East,VE2,Wolf_West,VW2).
	
% moving 1 wolf from west to east	
move([Wolf_East,Vamp_East,Wolf_West,Vamp_West,west],[WE2,Vamp_East,WW2,Vamp_West,east]):-
	WW2 is Wolf_West-1,
	WE2 is Wolf_East+1,
	valid(WE2,Vamp_East,WW2,Vamp_West).

% This heuristic is to consider final number of wolves and vamps on the east side
heuristic(_, [Wolf_East,Vamp_East|_], H) :-
    H is (Wolf_East+Vamp_East)/2.
    
% Cost of moving back and forth is 1
cost(_, _, C) :-
    C is 1.