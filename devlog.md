DEVLOG FOR CS4337 PROJECT 2 - ZANE SMITH (zps230000)

(5:46 PM 5/10) Pre-Session Thoughts: I'm still fresh in terms of my prolog experience, so I will have to plan out how I want to go about certain pathfinding / maze logic via a declarative language rather than an imperative one.
Prolog works like a big library of statements, so I'd ideally need a way of creating some predicates the evaluate steps and valid moves. For now I'm going to bed...

(5:55 AM 5/11) Pre-Session Thoughts: I'd like to start by creating a predicate to process the user input against the maze tokens.

(7:21 AM 5/11) Post-Session Thoughts: I've set up a functioning valid position tester! Some challenges I faced were understanding the "if-then" syntax, alongside the "nth0" keyword, but after I got that down, the rest of the function was easy to make.
I have to manually input the maze for now, but it compares a grid tile effectively to see if it's a w token, and if so it returns false. The next thing I'd like to work on is the user input, so I'll get started on that. 
I'm concerned about how I'm going to iterate through instructions, but it shouldn't be too much of a challenge.

(7:26 AM 5/11) Pre-Session Thoughts: Iteration is going to be a challenge, so I'm going to be looking ahead of time into potential iteration and path-finding algorithms and writing down ideas on how they can be implemented in prolog.

(7:59 AM 5/11) Post-Session Thoughts: I've used the read keyword to get the input path of the player successfully! Now I just need to iterate through each element and check if they're all valid.

(9:09 AM 5/11) Pre-Session Thoughts: After some research, I have deduced a way to iterate through the player input, involving recursion. To my knowledge, you cannot use typical control flow to iterate
through lists, so I must use recursion here. 

(9:41 AM 5/11) Post-Session Thoughts: I successfully performed a recursive iteration through the user input! It's interesting how the solution is to used what essentially are overloaded methods in a language like Java.
You set the parameter of the base case to an empty list so that calling the iterate function with an empty list defaults to the base case rather than the typical variant. The maze is still hard-coded, so I'll move
it over to be user-input next.

(11:04 AM 5/11) Pre-Session Thoughts: The next and final step of this project will be to implement a path finder if the input path is unbound. I will have to come up with another recursive algorithm for this, one that
returns the path and uses it, which will be challenging. I know a bit about pathfinding algorithms from an Algorithms and Data structures class, but I'll certainly need a refresher.
