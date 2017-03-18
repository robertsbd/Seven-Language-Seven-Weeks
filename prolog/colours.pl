sum(red, green, yellow).
sum(blue, red, magenta).
sum(green, blue, cyan).

add(Primary1, Primary2, Secondary) :- sum(Primary1, Primary2, Secondary).
add(Primary2, Primary1, Secondary) :- sum(Primary1, Primary2, Secondary).