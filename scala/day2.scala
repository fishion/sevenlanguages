
// sum the lengths of a list of strings
val list = List("a", "ab", "abc", "abcd")
println(
    list.foldLeft(0)( (sum, value) => sum + value.length )
)
// alternatively
println(
    (0 /: list) { (sum, value) => sum + value.length }
)


// A trait which will replace words in a list

import scala.io.Source._
trait Censor {
    var replacements = Map(
        "(?i)flim" -> "blim"
    )
    def addFromFile(filename:String){
        fromFile(filename).getLines.foreach( line => {
            val pair = line.split(", ")
            replacements += "(?i)" + pair(0) -> pair(1)
        })
    }
    def censor(text:String):String =
        replacements.foldLeft(text)( (text, pair) => text.replaceAll(pair._1,pair._2) )
}
class TextTool extends Censor

val tt = new TextTool()
tt.addFromFile("day2rudewords.txt")
println( tt.censor("I say to you Flim, Flam and Fooey") )
