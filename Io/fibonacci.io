// this is the exercise from Day 2 Self Study, page 68
// exercise 1.

// lets define our Fibonacci object
Fibonacci := Object clone
Fibonacci fib := method(nth, // generate the fibonacci sequence with a loop
    self sequence := List clone   
    self sequence append(1)
    self sequence append(1)
    for(i, 2, nth-1,
        self sequence append(self sequence at(i-1) + self sequence at(i-2))
    )
    self sequence at(nth-1) println
)

//Finonacci getSeqRec := method(nth

fibSeq := Fibonacci clone

fibSeq fib(10)
fibSeq fib(4)
fibSeq fib(7)

// now do it with recursion