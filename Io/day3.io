Builder := Object clone
Builder i := 1

Builder forward := method(
    i = 1
    writeln(i, "<", call message name, ">")
    call message arguments foreach(
        arg,
        content := self doMessage(arg);
        i = i + 1
        if(content type == "Sequence",
            writeln(i, content)
        )
    )
    writeln(i, "</", call message name, ">")
)

Builder ul(
        li("Io"),
        li("Lua"),
        li("JavaScript"))
