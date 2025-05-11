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
    
get_input_path(InputPath) :-
    format("Enter a LIST of directions:~n"),
    read(InputPath).
    
    
valid_move(Maze, (Row, Col)) :-
    %nth0 to just grab at index.
    nth0(Row, Maze, CurrRow),
    nth0(Col, CurrRow, CurrCell),
    CurrCell \= w. % Effectively a boolean, returns if CurrCell ISNT a wall.
    
    
test_valid_move(Maze, Position) :-
    (valid_move(Maze, Position) % if
        ->  
            format("~w is valid.~n", [Position])
        ;   
            format("~w is NOT valid.~n", [Position])
    ).


test :-
    
    % NOTE: Commas separate goals until the query is closed with a period.
    
    Maze = [
        [w, s, w, w],
        [w, f, w, w],
        [w, f, w, w],
        [w, e, w, w]
    ],
    
    Position = (2, 2),
    get_input_path(InputPath),
    format("You entered: ~w~n", [InputPath]),
    
    % If else block ()->;
    test_valid_move(Maze, Position).
    
    % "." End of query
    
:- main.
