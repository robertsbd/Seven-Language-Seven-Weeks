book_author('The Outsider', 'Albert Camus').
book_author('The Plague', 'Albert Camus').
book_author('Moby Dick', 'Herman Melville').
book_author('Waiting for Godot', 'Samuel Beckett').
book_author('More Pricks than Kicks', 'Samuel Beckett').
book_author('Macbeth', 'William Shakespears').
 
% the below will return the cases where the number of books are 1
%bagof(Title, book_author(Title, Author), X), length(X, Number_of_books), Number_of_books = 1).