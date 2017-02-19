// 10 attempts to guess a number

// This object has all the ifnormation we need to do the guessing
Guesses := clone Object
Guesses init := method(
    self n_guess := 1
    self prev_guess := 0 
    self stdin := File standardInput() // set up the standardInput  
)
Guesses setTarget := method(    // generate a random number rounded to an integer
    self target_num := Random value(0, 100) round()
)
Guesses makeGuess := method(

    write("Make a guess > ")
    guess := self stdin readLine asNumber

    if(self n_guess > 10,
        // if 10 or more guesses have been made
        writeln("I am sorry you only have 10 guesses, the number was ", self target_num),

        // if less than 10 guesses have been made
        guess_distance := (guess - self target_num) abs()
        prev_guess_distance := (self prev_guess - self target_num) abs()
 
        guess_state := String clone
    
        // Evaluate how close the guess is relative to the previous guess
        if(guess_distance == 0,
            guess_state = "Congratulations! You guessed correctly",
            if(n_guess == 1,
                guess_state = "",
                if(guess_distance == prev_guess_distance, 
                    guess_state = "Niether hotter or colder",
                    if(guess_distance < prev_guess_distance,
                        guess_state = "Hotter",
                        guess_state = "Colder"
                    )
                )
            )
        )
     
        // feedback to the user
        writeln("This is guess ", self n_guess, ". ", guess_state)

        self prev_guess = guess
        self n_guess = self n_guess + 1
    )
)

myGuesses := Guesses clone
myGuesses setTarget

loop( myGuesses makeGuess ) // we are just going to loop forever, guesses don't count after 10 goes anyway and user is informed