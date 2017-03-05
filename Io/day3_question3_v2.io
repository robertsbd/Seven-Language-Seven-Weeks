// this works *** Question 1

OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg, 
        r doMessage(arg)
        )
    r
)
Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1)
    )
)

//s := Object clone
s := {
    "Bob Smith": "5195551212",
    "Mary Walsh": "4162223434"
}

//s := File with("phonebook.txt") openForReading contents
phoneNumbers := s
//phoneNumbers := doString(s)
phoneNumbers keys println
phoneNumbers values println

/*

Builder := Object clone

Builder x := ""

Builder forward := method( 

    y := x
    x = x .. "   "
    
    writeln(y, "<", call message name, ">")
  //  curlyBrackets print
    call message arguments foreach(
        arg,
        content := self doMessage(arg); // this line is calling the method recursively
        if(content type == "Sequence",
            writeln(y, content)
        )
    )
    x = y
    writeln(y, "</", call message name, ">") 
)

Builder ul(
            li(
                my_library(
                    book("Man without Qualities"),
                    book("The Outsider"),
                    book({"Author": "Herman Melville"}, "Moby Dick")
                ),
                your_library(
                    book("To the Lighthouse"),
                    book("Invisible Cities"),
                    book("Master and Margarita")
                )                
            )
        )
*/