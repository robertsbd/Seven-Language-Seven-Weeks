// Working now

OperatorTable addAssignOperator(":", "atPutAtt")

Builder := Object clone
Builder x := Sequence clone

// parse each attribute. Called when it sees a ":" and then takes the args either side and appends the string to the list
List atPutAtt := method(
    self append(call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\"") .. "=\"" .. call evalArgAt(1) .. "\"")
)

curlyBrackets := method(
    r := List clone
    out_txt := Sequence clone

    // go through all the arguments within {}, this means we will proc atPutAtt
    call message arguments foreach(arg,
        r doString(arg asString)
    )

    // write out the attributes, remove hanging ";"
    r foreach(el, out_txt = out_txt .. el .. ";")
    writeln(out_txt asMutable removeSuffix(";"), ">")
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
