CS4337 PROJECT 2 README

HOW TO RUN:
Ensure you have a Prolog interpreter installed.
CD to wherever you have downloaded this file (IF you're on Linux, else, open the Windows Application).
Type "?- [CS4337Project2]." to run the program.
Type "?- main." to run main.

----------------------------

PREDICATE FUNCTIONALITY:

get_input/2 - Reads the two user inputs (Maze, Path?) from the terminal in order to be used in the program.

move/3 - Comes in four variants such that Prolog can attempt other directions (For pathfinding purposes). Defines Col2 or Row2 based on the direction chosen.

cell/3 - Defines CurrCell based on a maze input alongside a coordinate input.

valid_move/2 - Gets the previously seen cell based on the input coordinates, checks if it is a wall.

test_valid_move/2 - Mostly an unused function from earlier in the project's development, used for printing and testing.

iterate/3 (Empty list variant) - Base case for the iterate function. Prints "Win!" or "Lose!" based on if the last-reached cell was "e" or not.

iterate/3 (Standard) - Iterates recursively through the instruction list, and if an invalid move is encountered, it prints "Lose!".

get_start_cell/2 - Sets the StartPos variable, begins the 2D array search for an "s" tile.

search/3 - Recursively calls itself to descend rows whilst checking if each of its columns have the "s" tile.

search_row/3 - Resolves immediately if the leading tile is "s", otherwise it recurses down incrementing its column index, trying again.

find_path/3 - Wraps and resolves the pathfind predicate.

pathfind/4 (Empty Direction Variant) - If no directions work, it will see if you are at the end, and will resolve if the tile is "e".

pathfind/4 (Standard) - Builds up it's list of directions as it recurses, attempts moves (If one move attempt didn't resolve, Prolog will try the next defined move). Ensures no previous path members are NextPos candidates.
