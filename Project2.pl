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
get_input_path(InputPath) :-
    format("Enter a LIST of directions:~n"),
    read(InputPath).
    
    
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
    

% A bit like java's overloading vvv
iterate([], Maze, Pos) :-
    format("End of instructions.~n"),
    cell(Maze, Pos, LastCellWeReached),
    (LastCellWeReached == e % if
        ->  
            format("Win!")
        ;   
            format("Lose!")
    ).


% Iteration recursion
iterate([FirstInstruction|RestInstructions], Maze, CurrPos) :-
    move(FirstInstruction, CurrPos, NextPos),
    valid_move(Maze, NextPos), 
    iterate(RestInstructions, Maze, NextPos). % Like Racket with the Cons/Rest structures
    % NextPos becomes CurrPos...


test :-
    % NOTE: Commas separate goals until the query is closed with a period.
    
    Maze = [
        [w, s, w, w],
        [w, f, w, w],
        [w, f, w, w],
        [w, e, w, w]
    ],
    
    get_input_path(InputPath),
    format("You entered: ~w~n", [InputPath]),
    iterate(InputPath, Maze, (1,2)).
    
    % "." End of query
    
:- main.
