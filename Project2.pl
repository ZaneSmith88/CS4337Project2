% CS 4337 PROJECT 2 (Maze)

/* 

Requirements...
Four moves: (Up, down, left, right)
Spaces: Start, End(s), Wall(s), and Free(s)
Unbound variable can be the input, in which case it will have to solve it.
NOTE: Atoms or symbols are always lowercase, variables are uppercase.
*/

main:-
    test.
    
% Input
get_input(Maze, InputPath) :-
    format("Enter a MAZE:~n"),
    read(Maze),  % Read the maze
    format("Enter a LIST of directions (Or type unbound to Pathfind):~n"),
    read(InputPath).  % Read the list of directions
    
    
% Our move predicates
move(up,    (Row,Col), (Row2,Col)) :- 
    Row2 is Row - 1.
move(down,  (Row,Col), (Row2,Col)) :- 
    Row2 is Row + 1.
move(left,  (Row,Col), (Row,Col2)) :- 
    Col2 is Col - 1.
move(right, (Row,Col), (Row,Col2)) :- 
    Col2 is Col + 1.
    

% A simple get cell function
cell(Maze, (Row, Col), CurrCell) :-
    nth0(Row, Maze, CurrRow),
    nth0(Col, CurrRow, CurrCell).
    
    
% Gets the cell and checks if it's a wall.
valid_move(Maze, (Row, Col)) :-
    %nth0 to just grab at index.
    cell(Maze, (Row, Col), CurrCell),
    CurrCell \= w. % Effectively a boolean, returns if CurrCell ISNT a wall.
    
    
% If statement that prints based on the output of valid_move
test_valid_move(Maze, Position) :-
    (valid_move(Maze, Position) % if
        ->  
            format("~w is valid.~n", [Position])
        ;   
            format("~w is NOT valid.~n", [Position])
    ).
    

% Iteration recursion
iterate([], Maze, Pos) :-
    format("End of instructions.~n"),
    cell(Maze, Pos, LastCellWeReached),
    (LastCellWeReached == e
        ->  
            format("Win!")
        ;   
            format("Lose!")
    ).


iterate([FirstInstruction|RestInstructions], Maze, CurrPos) :-
    move(FirstInstruction, CurrPos, NextPos),
    (valid_move(Maze, NextPos)
        ->  
            iterate(RestInstructions, Maze, NextPos) % Like Racket with the Cons/Rest structures
        ;   
            format("Lose!"), fail
    ).
    % NextPos becomes CurrPos...


% Getting the starting cell...
get_start_cell(Maze, StartPos) :-
    search(Maze, 0, StartPos).

search([Row|RestRows], RowIndex, StartPos) :-
    (search_row(Row, 0, ColIndex)
        ->  
            StartPos = (RowIndex, ColIndex)
        ;
            Inc is RowIndex + 1,
            search(RestRows, Inc, StartPos)
    ).

search_row([s|_], ColIndex, ColIndex).
search_row([_|Rest], CurrIndex, ColIndex) :-
    NextIndex is CurrIndex + 1,
    search_row(Rest, NextIndex, ColIndex).
    

% Recursive pathfinding --------->
pathfind(Maze, CurrPos, _, []) :- %base
    cell(Maze, CurrPos, e). % Normally returns to e, but since e is an atom it compares, returning true or false.
pathfind(Maze, CurrPos, Visited, [Direction | Path]) :-
    move(Direction, CurrPos, NextPos),
    valid_move(Maze, NextPos),
    \+ member(NextPos, Visited),  % Nextpos SHOULDNT be a member of visited
    pathfind(Maze, NextPos, [NextPos | Visited], Path).
    
find_path(Maze, StartPos, Path) :-
    pathfind(Maze, StartPos, [StartPos], Path).
%--------------------------------------------->


test :-
    % NOTE: Commas separate goals until the query is closed with a period.
    
    get_input(Maze, InputPath),
    get_start_cell(Maze, StartPos),
    %iterate(InputPath, Maze, StartPos).
    
    (InputPath == unbound 
    ->
        find_path(Maze, StartPos, PFind),
        format("Path found! ~w~n", [PFind]),
        iterate(PFind, Maze, StartPos)
    ;
        iterate(InputPath, Maze, StartPos)
    ).
    
    % "." End of query
    
:- main.
