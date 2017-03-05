// Question 3, need to incorporate the ability to add attributes in this xml program
// incorporating the answer into the


Builder := Object clone
Builder x := ""

Builder forward := method( 

    startTag := Sequence clone // this is going to be the start startTag
    y := x
    x = x .. "   "

    // writing start tag

    msg := call message name
    if(msg == "curlyBrackets", // if there is a curlyBracket then we need to get the info associated with attributes
        call message arguments foreach(arg, 
            startTag = startTag .. arg 
        ),
        startTag = call message name
    )
    writeln(y, "<", startTag, ">")
   
    // writing inner content

    call message arguments foreach(
        arg,
        content := self doMessage(arg); // this line is calling the method recursively
        if(content type == "Sequence",
            writeln(y, content)
        )
    )
    
    // write closing tag
    x = y
    writeln(y, "</", call message name, ">") 

)

Builder ul(
            li(
                languages(
                    li("Io"),
                    li("Lua"),
                    book({"author"})
                ),
                languages(
                    li("C++"),
                    li("Java"),
                    li("Scala")
                )                
            )
        )
