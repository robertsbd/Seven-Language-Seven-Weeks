% this will take a maze and then solve it. Can only deal with a no loops.

% The maze as knowledge base. Value of -1 is the end

maze(1,8,1). maze(2,8,1). maze(3,8,0). maze(4,8,1). maze(5,8,1). maze(6, 8, 1).
maze(1,7,1). maze(2,7,1). maze(3,7,0). maze(4,7,1). maze(5,7,1). maze(6, 7, 1).
maze(1,6,1). maze(2,6,1). maze(3,6,0). maze(4,6,0). maze(5,6,0). maze(6, 6, 1).
maze(1,5,1). maze(2,5,0). maze(3,5,1). maze(4,5,1). maze(5,5,0). maze(6, 5, 1).
maze(1,4,1). maze(2,4,0). maze(3,4,0). maze(4,4,0). maze(5,4,0). maze(6, 4, 1).
maze(1,3,1). maze(2,3,0). maze(3,3,1). maze(4,3,1). maze(5,3,0). maze(6, 3, 1).
maze(1,2,1). maze(2,2,0). maze(3,2,0). maze(4,2,1). maze(5,2,0). maze(6, 2, 1).
maze(1,1,1). maze(2,1,1). maze(3,1,0). maze(4,1,1). maze(5,1,1). maze(6, 1, 1).

% is it valid to move from a point to a neighboring points
is_move((X,Y),(MoveX,MoveY)) :-
    maze(X,Y,0),                                        % Start point matched to empty point in maze
    (                                                   % End point is:
        ((MoveX is X + 1; MoveX is X - 1), MoveY is Y); % move to the left or Right OR
        ((MoveY is Y + 1; MoveY is Y - 1), MoveX is X)  % move up or down
    ),
    maze(MoveX,MoveY,0).                                % does an empty point exist that is moved up or down

/******************/
/** solve_maze() **/
/******************/
% can we move from one point to another, checking that we don't visit the point we came from in the previous move
% need to get this to output the solution through backtracking
% solve_maze/2 - so we can take inputs that don't have a starting value of Prev, give Prev a value that is impossible

solve_maze(From, To) :- 
    solve_maze((-99,-99), From, To).

% solve_maze/3 - terminating
solve_maze(_, From, To) :- 
    is_move(From, To).

%solve_maze/3 - recursive
solve_maze(Previous, From, To) :-
    is_move(From, Intermediate),
    Intermediate \= Previous,
    write(Intermediate), nl,
    solve_maze(From, Intermediate, To).