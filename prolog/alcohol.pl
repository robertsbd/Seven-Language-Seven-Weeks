% category procedure
category(coca_cola, soft_drink).
category(wine, light_alcoholic).
category(whiskey, hard_liquor).
category(brandy, hard_liquor).

% age procedure
age(pierre, 29).
age(john, 21).
age(julie, 20).
age(nancy, 17).

%buy rules procedure
buy(Person, Drink) :-
    age(Person, Age),
    Age >= 0,
    category(Drink, soft_drink).
    
buy(Person, Drink) :-
    age(Person, Age),
    Age >= 18,
    category(Drink, light_alcoholic).    

buy(Person, Drink) :-
    age(Person, Age),
    Age >= 21,
    category(Drink, hard_liquor).    