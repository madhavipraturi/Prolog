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

% This is the entry point of execution. Run this method to execute all cases.
exec2 :-
   
    VW = puzzle([0,0,3,3,west],[3,3,0,0,east]),

    nl, write('BFS on Vamp-Wolf Puzzle:'), nl,
    statistics(walltime, [ _ | _ ]),
    solve(VW, bfs, vw),
    statistics(walltime, [ _ | [ExecutionTime1]]),
    write('Execution took '), write(ExecutionTime1), write(' ms.'), nl,
    
    nl, write('DFS on Vamp-Wolf Puzzle:'), nl,
    statistics(walltime, [ _ | _ ]),
    solve(VW, dfs, vw),
    statistics(walltime, [ _ | [ExecutionTime2]]),
    write('Execution took '), write(ExecutionTime2), write(' ms.'), nl,
    
    nl, write('BestFS on Vamp-Wolf Puzzle:'), nl,
    statistics(walltime, [ _ | _ ]),
    solve(VW, hfs, vw),
    statistics(walltime, [ _ | [ExecutionTime3]]),
    write('Execution took '), write(ExecutionTime3), write(' ms.'), nl,
    
    nl, write('Done.'), nl.
