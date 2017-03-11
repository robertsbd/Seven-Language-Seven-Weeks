book_author('The Outsider', 'Albert Camus').
book_author('The Plague', 'Albert Camus').
book_author('Moby Dick', 'Herman Melville').
book_author('Waiting for Godot', 'Samuel Beckett').
book_author('More Pricks than Kicks', 'Samuel Beckett').
book_author('Macbeth', 'William Shakespears').

% this will evaluate is the author entered only has a single book
author_has_one_book(Author) :-  
    findall(Title, book_author(Title, Author), X), 
    length(X, Number_of_books), 
    Number_of_books = 1.
 
print(bagof(Title, book_author(Title, Author), X), length(X, Number_of_books), Number_of_books = 1).