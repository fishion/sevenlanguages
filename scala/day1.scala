import Array._

class Board(size:Int) {
    val board = ofDim[String](size,size)
    var player = ""
    val empty = "_"

    def newGame() {
        for (i <- 0 until board.length){
            for (j <- 0 until board(i).length){
                board(i)(j) = empty
            }
        }
        nextplayer
    }

    def nextplayer() {
        player = if (player == "X") "O" else "X"
        play
    }

    def play() {
        print("Player " + player + " enter a row number (1 to "+ size +")")
        var row = readInt
        print("Player " + player + " enter a column number (1 to "+ size +")")
        var col = readInt
        addToBoard(col,row)
    }

    def addToBoard(x:Int, y:Int) {
        try {
            if (board(y-1)(x-1) != empty){
                println(x + "," + y + " already in use")
                play
                return
            }
        }
        catch {
            case e : java.lang.ArrayIndexOutOfBoundsException =>
                println(x + "," + y + " doesn't fit on the board fool")
            play
            return
        }

        println("Player " + player + " plays to " + x + "," + y)
        board(y-1)(x-1) = player
        dump
        if (detectWinner(y-1, x-1)) return
        if (detectDraw) return
        nextplayer
    }

    def detectWinner(row:Int, col:Int):Boolean = {
        var winningrow = true
        var winningcol = true
        var winningdiag1 = true
        var winningdiag2 = true
        for (i <- 1 until size){
            if (board(row)(i) != board(row)(i-1)) winningrow = false
            if (board(i)(col) != board(i-1)(col)) winningcol = false
            if (board(i)(i) != board(i-1)(i-1)) winningdiag1 = false
            if (board(i)(i) == empty) winningdiag1 = false
            if (board(i)(size-i-1) != board(i-1)(size-i) ) winningdiag2 = false
            if (board(i)(size-i-1) == empty) winningdiag2 = false
        }
        if (winningrow || winningcol || winningdiag1 || winningdiag2){
            println("Congratulations player " + player + ". You won")
            return true
        }
        return false
    }
    def detectDraw():Boolean = {
        board.foreach(row =>
            row.foreach(cell =>
                if (cell == empty) return false
            )
        )
        println("It's a draw!")
        return true
    }


    def dump() {
        board.foreach( row =>
            println(row.mkString(","))
        )
        println
    }
}

print("How big do you want the board to be?")
val myboard = new Board(readInt)
myboard.newGame
