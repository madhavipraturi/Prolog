Readme
=======

State Definitions
==================
Sliding tile:
=============
State - A sequence of all 15 numbers including the blank. This sequence is the flattened form of a 4x4 matrix.

example - '1'/'2'/0/'4'/'5'/'6'/'3'/'7'/'8'/'9'/'10'/'11'/'12'/'13'/'14'/'15'

I have taken the state as a flat matrix because, it would be easier to calculate Manhattan Distance for the heuristic and also,
it doesn't tamper with the actual positions of those numbers from the matrix. This way, it would also be easier to track the movement of the
blank space. Here, "0" represents the blank space on the sliding tile puzzle.
Also, matrix computations are more time taking (O(n^2)) when compared to array.

Vamp-Wolf:
=========
State - [number of wolves on east side, number of vamps on east side, number of wolves on west side, number of vamps on west side, boat position]

example - [0,0,3,3,east]

I have chosen this state definition so that tracking of boat, wolves and vamps will be easier and clear. 

Execution details:
==================
Sliding tile:
=============
-> exec1 in "project2_st_exec.pl" is the entry point for the sliding tile puzzle
-> consult all files
-> run "exec1."
-> results will be in the console.

Vamp-wolf:
==========
-> exec2 in "project2.pl" is the entry point for the vamp-wolf puzzle
-> consult all files
-> run "exec2."
-> results will be in the console.

P.s:
======
All the test cases executed in the log files are there in the "project2.pl" and "project2_st_exec.pl" for vamp-wolf and sliding tile puzzles respectively.
To give new test cases:

for sliding tile:
=================
->create a new tuple:
ST = (Start State, Goal State)

->call solve with required search strategy and the type is "st"
example - solve(ST,bfs,st)

for vamp-wolf:
==============
->create a new tuple:
VW = (Start State, Goal State)

->->call solve with required search strategy and the type is "vw"
example - solve(VW,bfs,vw)

Reference
=========
Luger, G. F. (2005). Artificial intelligence: structures and strategies for complex problem solving. Pearson education.