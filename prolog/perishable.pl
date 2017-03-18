% food(name of the food, ingredients of food, is perishable)
food(spam, mince, no).
food(mince, pork, no).
food(pork, none, yes).
food(pie, apple, no).
food(apple, none, yes).
food(spacefood, spacedust, no).
food(spacedust, none, no).

perishable(Name) :-
    food(Name, _, yes).

perishable(Name) :-
    food(Name, Ingredient_name, _),
    perishable(Ingredient_name).