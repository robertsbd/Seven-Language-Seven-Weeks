OperatorTable addAssignOperator(":", "addAttributes")

Builder := Object clone

Builder x := ""

Map addAttributes := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""), 
        call evalArgAt(1)
    )
)

curlyBrackets := method(

    r := List clone

    call message arguments foreach(arg, 
        doString(arg asString)
    )
    r
)

Builder forward := method( 

    y := x
    x = x .. "   "
    
    writeln(y, "<", call message name, ">")

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
                    book({"Author":"Herman Melville"},{"Date of Pub": "1987"}, "Moby Dick")
                ),
                your_library(
                    book("To the Lighthouse"),
                    book("Invisible Cities"),
                    book("Master and Margarita")
                )                
            )
        )
