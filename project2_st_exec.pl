:- [abstract_types].
:- [bfs].
:- [dfs].
:- [hfs].

% Switch is used to change control to all search strategies
solve(puzzle(Start, Goal), Strategy, Type) :-
    switch(Strategy, [
        bfs : bfs(Start, Goal, Type),
        dfs : dfs(Start, Goal, Type),
        hfs : hfs(Start, Goal, Type)]).

% Program entry point, 'exec1.' will evaluate all cases.
exec1 :-
    ST1 = puzzle('1'/0/'2'/'4'/'5'/'6'/'3'/'7'/'8'/'9'/'10'/'11'/'12'/'13'/'14'/'15', '1'/'2'/'3'/'4'/'5'/'6'/0/'7'/'8'/'9'/'10'/'11'/'12'/'13'/'14'/'15'),
    ST2 = puzzle('1'/'2'/0/'4'/'5'/'6'/'3'/'7'/'8'/'9'/'10'/'11'/'12'/'13'/'14'/'15', '1'/'2'/'3'/'4'/'5'/'6'/0/'7'/'8'/'9'/'10'/'11'/'12'/'13'/'14'/'15'),
    ST3 = puzzle('1'/'6'/'2'/'4'/'5'/0/'3'/'7'/'8'/'9'/'10'/'11'/'12'/'13'/'14'/'15', '1'/'2'/'3'/'4'/'5'/'6'/0/'7'/'8'/'9'/'10'/'11'/'12'/'13'/'14'/'15'),
    

    write('BFS on 15 Tile Puzzle1:'), nl,
    statistics(walltime, [ _ | _ ]),
    solve(ST1, bfs, st),
    statistics(walltime, [ _ | [ExecutionTime1]]),
    write('Execution took '), write(ExecutionTime1), write(' ms.'), nl,
  
  
    nl, write('DFS on 15 Tile Puzzle1:'), nl,
    statistics(walltime, [ _ | _ ]),
    solve(ST2, dfs, st),
    statistics(walltime, [ _ | [ExecutionTime2]]),
    write('Execution took '), write(ExecutionTime2), write(' ms.'), nl,
    
    
    nl, write('BestFS on 15 Tile Puzzle:'), nl,
    statistics(walltime, [ _ | _ ]),
    solve(ST3, hfs, st),
    statistics(walltime, [ _ | [ExecutionTime3]]),
    write('Execution took '), write(ExecutionTime3), write(' ms.'), nl,
     
    nl, write('Done.'), nl.
