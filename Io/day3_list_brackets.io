// create a list syntax that uses brackets ()

squareBrackets := method(
    r := List clone
    call message arguments foreach(arg,
        r append(doMessage(arg))
    )
)

myList := ["hello", "world"]
myList print