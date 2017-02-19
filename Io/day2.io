// day 2 exercise

// question 1 in file fibonacci

// question 2

"*************** QUESTION 2" println

(10 / 2) println
(10 / 0) println

origDiv := Number getSlot("/")

Number / := method(x,

    if(x == 0, 0, origDiv(x))

)

(10 / 2) println
(10 / 0) println

// question 3

"*********** QUESTION 3" println 

TwoDArray := list(list(1,2,3), list (4,5,6), list(7,8,9))

sumx := Number clone
sumx = 0

TwoDArray foreach(i, v, 
    sumx = sumx + v sum
)

"Summed number" print; sumx println

"*********** QUESTION 4" println 

myList := List clone

myList = list(1,2,3,4,5)
//myList = list(1, 2, 3, "a")

myList println

myList myAverage := method(

    self sum / self size

)

myList numAverage := method(

    sumx := Number clone
    sumx = 0

    self foreach(i, v,
        if( v type != Number type, 
            Exception raise("non-numeric value found"),
            sumx = v + sumx
        )    
    )

    sumx / self size

)

myList numAverage println

"*********** QUESTION 5" println 

TwoDList := Object clone
TwoDList vals := List clone
TwoDList dim := method(x, y, // we create an x * y array full of nil values
    for(i, 0, x-1,
        self vals append(list())
        for(j, 0, y-1,
            self vals at(i) append(nil)
        )
    )
)
TwoDList set := method(x,y,value,
    self vals at(x) atPut(y, value)
)
TwoDList get := method(x,y,
    self vals at(x) at(y)
)
TwoDList transpose := method(
    x := self vals size
    y := self vals at(0) size

    transposedArray := self clone
    transposedArray vals := List clone
    transposedArray dim(y,x)

    for(i, 0, x-1,
        for(j, 0, y-1,
            transposedArray set(j, i, (self get(i, j)))
        )
    )
    return transposedArray vals
)
TwoDList writeToFile := method(file, // write the matrix to file as a csv

    x := self vals size
    y := self vals at(0) size

    f := File with (file)
    f openForUpdating

    for(i, 0, x-1,
        for(j, 0, y-1,
            f write(self get(i, j) asString)
            if(j != y-1, f write(","))
        )
        f write("\n")
    ) 
    f close
)

myList := TwoDList clone
myList dim(3,2)
myList vals println
myList set(0,0,15)
myList set(1,1,16)
myList vals println
myList get(0,0) println

"*********** QUESTION 6" println 
// Transpose a file
myList transpose println

"*********** QUESTION 7" println 
// write a matrix to a file
myList writeToFile("matrix_to_file.txt")
// won't read from file as it will just be the opposite of writing to a file