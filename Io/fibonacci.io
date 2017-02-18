// this is the exercise from Day 2 Self Study, page 68
// exercise 1.

// lets define our Fibonacci object
Fibonacci := Object clone
Fibonacci fib := method(nth, // generate the fibonacci sequence with a loop   
    self x1 := 1
    self x2 := 1
    self out := nil
    
    if(nth < 3, 
        return 1, 
        for(i, 3, nth,
            self out = self x2 + self x1
            self x1 = x2
            self x2 = out
        )
        return out
    )
)
Fibonacci fibr := method(n, // generate the fibonacci sequence with recursion

    if(n < 2,
        return n,
        return self fibr(n-1) + self fibr(n-2)
    )
)

fibSeq := Fibonacci clone

fibSeq fib(5) println

fibSeq fibr(4) println