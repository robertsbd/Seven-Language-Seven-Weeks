// class for a single position

class Line {

    var moves: Array[String] = new Array[String](3)
    
    for( i <- 0 until moves.length) {
        moves{i} = "."
    }
 
    def move(i: Integer, input_move: String) {
        moves{i} = input_move
    }

    def printLine () = println(moves.deep.mkString("\t"))

}

class Board {

    // define all the positions
    var line1 = new Line
    var line2 = new Line
    var line3 = new Line

    var continue_game: Boolean = true // keep playing the game, becomes false if game is over
    println("Shall we play a game?")

    def isWin(player: String): Boolean =   // test if any of the win conditions have been met
    { 

        val comparator = Array(player, player, player)

        if(
            line1.moves.deep == comparator.deep ||
            line2.moves.deep == comparator.deep ||
            line3.moves.deep == comparator.deep ||
            Array(line1.moves{0}, line2.moves{0}, line3.moves{0}).deep == comparator.deep || 
            Array(line1.moves{1}, line2.moves{1}, line3.moves{1}).deep == comparator.deep ||
            Array(line1.moves{2}, line2.moves{2}, line3.moves{2}).deep == comparator.deep ||            
            Array(line1.moves{0}, line2.moves{1}, line3.moves{2}).deep == comparator.deep ||            
            Array(line1.moves{2}, line2.moves{1}, line3.moves{0}).deep == comparator.deep
        ) {
            true
        } else {
            false
        }
    }   

    def testWin() {

        var game_state: String = null

        if (isWin("X")) {
            game_state = "Winner X"
            continue_game = false
        } else if (isWin("O")) {
            game_state = "Winner O"
            continue_game = false
        } else if (line1.moves.filter(_ == ".").length == 0 && line2.moves.filter(_ == ".").length == 0 && line3.moves.filter(_ == ".").length == 0) {  
            game_state = "Tie"
            continue_game = false
        } else {
            game_state = "Enter next move"
        }

        println(game_state + "\n")

    }

    def move(line: Int, i: Int, new_val: String) {   

        if (line == 1) {
            line1.move(i, new_val)
        } else
        if (line == 2) {
            line2.move(i, new_val)
        } else
        if (line == 3) {
            line3.move(i, new_val)
        } else {
            println("INVALID LINE")
        }

        // print the board after each move
        println(" 1\t2\t3")
        print("1")
        line1.printLine
        print("2")
        line2.printLine
        print("3")
        line3.printLine
    
        // has anyone won?
        testWin
    } 

    def getMove() {
        val line = readLine("Enter line of next move (1-3) > ").toInt
        val index = readLine("Enter col of next move (1-3) > ").toInt
        val new_val = readLine("Enter type of next move (X/O > ")
        
        move(line, index-1, new_val)
    }
}

var myBoard = new Board

while ( myBoard.continue_game ){
    myBoard.getMove
}