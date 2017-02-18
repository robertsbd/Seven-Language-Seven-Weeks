// this is the exercise from Day 2 Self Study, page 68
// exercise 1.

// lets define our Fibonacci object
Fibonacci := Object clone
Fibonacci sequence := List clone
Fibonacci length := Object clone // how long will the fibonnacci sequence be
Fibonacci genSeq := method( // generate the fibonacci sequence 
    self sequence append(1)
    self sequence append(1)
    for(i, 2, length-1,
        self sequence append(self sequence at(i-1) + self sequence at(i-2))
    )
)
Fibonacci fib := method(nth, // generate a list of the length that we wish to report
    self sequence := List clone
    self length = nth
    self genSeq
    self sequence at(self length-1) println
)

fibSeq := Fibonacci clone

fibSeq fib(10)
fibSeq fib(4)
fibSeq fib(7)