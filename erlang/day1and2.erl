-module(day1and2).
-export([number_of_words/1]).
-export([number_of_wordsH/2]).
-export([count_to_ten/0]).
-export([count_to_tenH/2]).
-export([match_error/1]).
-export([return_languages/2]).

%%%%%%%%%%% DAY 1 %%%%%%%%%%%%

% Question 1
% numberOfWords counts up spaces.
% we need to strip any spaces at the start and end as these will cause problems, 
% also if there is more than one space in a row, we should also replace characters like \t and so forth,
% I won't do all this as I don't think this is the point

number_of_words(Xs) -> number_of_wordsH(Xs, 1).               

number_of_wordsH([], N) -> N;
number_of_wordsH([32|Xs], N) -> number_of_wordsH(Xs, N+1);      % if start of list is a space then lets add 1 
number_of_wordsH([_|Xs], N) -> number_of_wordsH(Xs, N).          % if not then just remove the beginning of the list

% Question 2
% count_to_ten will create a list of numbers 1 to 10 recursively

count_to_ten() -> count_to_tenH([], 1).

count_to_tenH(ListOfNumbers, 11) -> ListOfNumbers;
count_to_tenH(ListOfNumbers, N) -> [N|count_to_tenH(ListOfNumbers, N+1)]. 

% Question 3
% match_error, if you input tuple of form {error, Message} will return an error message, success if you pass success and unknown input otherwise

match_error({error, Message}) -> "error: " ++ Message;
match_error("success") -> "success";
match_error(_) -> "unknown input".

%%%%%%%%%%% DAY 2 %%%%%%%%%%%%

% Question 1
% return_languages - input the key - an atom, the LanguageList and will lookup the Description associated with the atom key
% Languages = [{erlang, "a functional language"}, {ruby, "a prototype language"}, {io, "a prototype language"}, {scala, "a mixed language"}].

return_languages(LanguageKey, LanguageList) -> [Description || {Name, Description} <- LanguageList, LanguageKey == Name].

% Question 2