DEVLOG FOR CS4337 PROJECT 2 - ZANE SMITH (zps230000)

(5:46 PM 5/10) Pre-Session Thoughts: I'm still fresh in terms of my prolog experience, so I will have to plan out how I want to go about certain pathfinding / maze logic via a declarative language rather than an imperative one.
Prolog works like a big library of statements, so I'd ideally need a way of creating some predicates the evaluate steps and valid moves. For now I'm going to bed...

(5:55 AM 5/11) Pre-Session Thoughts: I'd like to start by creating a predicate to process the user input against the maze tokens.

(7:21 AM 5/11) Post-Session Thoughts: I've set up a functioning valid position tester! Some challenges I faced were understanding the "if-then" syntax, alongside the "nth0" keyword, but after I got that down, the rest of the function was easy to make.
I have to manually input the maze for now, but it compares a grid tile effectively to see if it's a w token, and if so it returns false. The next thing I'd like to work on is the user input, so I'll get started on that. 
I'm concerned about how I'm going to iterate through instructions, but it shouldn't be too much of a challenge.
