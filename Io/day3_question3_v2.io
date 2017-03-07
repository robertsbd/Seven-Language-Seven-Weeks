// this will fail if you give it two different attributes - fix this

OperatorTable addAssignOperator(":", "atPutAtt")

Builder := Object clone
Builder x := Sequence clone
Builder lastName := Sequence clone

Map atPutAtt := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""), 
        call evalArgAt(1))
)

curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg,
        r doString(arg asString)
    )

    i := Number clone
    i = 0
    write("<", lastName, " ")
    r foreach(el,
        write(r keys at(i), "=\"", r values at(i), "\";")
        i = i + 1
    )
    writeln(">")
)

Builder forward := method( 

    y := x
    x = x .. "   "

// by doinig this if statement it will cause problems with content being printed, I am pretty sure it is from the 
// recursive calls, not putting it in an if will cause it not to print the content we need

    if( call message argAt(0) asString containsSeq("curlyBrackets"),   
        y print,
        writeln(y, "<", call message name, ">")
        lastName = call message name
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
                    book("Man without Qualities"),
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
