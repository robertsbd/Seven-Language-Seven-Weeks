// this works *** Question 1

Builder := Object clone
Builder x := ""

Builder forward := method( 

    y := x
    x = x .. " "
    writeln(y, "<", call message name, ">")
    call message arguments foreach(
        arg,
        content := self doMessage(arg); // this line appears to be calling the method recursively
        if(content type == "Sequence",
            writeln(y, content)
        )
    )
    x = y
    writeln(y, "</", call message name, ">") 
)

Builder ul(
            li(
                ul(
                    li("Io"),
                    li("Lua"),
                    li("JavaScript")
                ),
                ul(
                    li("C++"),
                    li("Java"),
                    li("Scala")
                )                
            )
        )
