// day 3 question2

// create a list syntax that uses square brackets [], could do this with curly brackets {} also
// but not with normal brackets ()

squareBrackets := method(
    r := List clone
    call message arguments foreach(arg,
        r append(doMessage(arg))
    )
)

myList := ["hello", "world"]
myList print