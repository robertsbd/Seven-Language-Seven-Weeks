// Working now

OperatorTable addAssignOperator(":", "atPutAtt")

Builder := Object clone
Builder x := Sequence clone

// parse each attribute,called when it sees a : and then takes the args either side and returns appends the string to itself
List atPutAtt := method(
    self append(call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\"") .. "=\"" .. call evalArgAt(1) .. "\"")
)

curlyBrackets := method(
    r := List clone

    // go through all the arguments withing {}
    call message arguments foreach(arg,
        r doString(arg asString)
    )

    // write out the attributes
    r foreach(el, write(el, ";"))
    writeln(">")
)

Builder forward := method( 

    y := x
    x = x .. "   "

    if( call message argAt(0) asString beginsWithSeq("curlyBrackets"),   
        write(y, "<", call message name, " "), // only write the start {} will then be called
        writeln(y, "<", call message name, ">")
    )

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
                    book({"Author":"Unknown"}, "Man without Qualities"),
                    book("The Outsider"),
                    book({"Author":"Herman Melville", "Name":"Ben"}, "Moby Dick")
                ),
                your_library(
                    book("To the Lighthouse"),
                    book("Invisible Cities"),
                    book("Master and Margarita")
                )                
            )
        )
