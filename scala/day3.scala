import scala.io._
import scala.actors._
import Actor._
import java.util.Random


object PageLoader {
    // going to cheat as I have no internets
    //def getPageSize(url : String) = Source.fromURL(url).mkstring.length
    def getPageSize(url : String) = {
        Thread.sleep(1000)
        new Random().nextInt(1000)
    }
}

val urls = List("http://www.amazon.com",
                "http://www.twitter.com",
                "http://www.google.com",
                "http://www.bbc.co.uk" )

def timeMethod(method: () => Unit) = {
    val start = System.nanoTime
    method()
    println("method took " + (System.nanoTime - start)/1000000000 + " seconds")
}

def getPageSizeSequentially() = {
    for(url <- urls) {
        println("Size for " + url + " : " + PageLoader.getPageSize(url))
    }
}

def getPageSizeConcurrently() = {
    val caller = self
    for (url <- urls) {
        actor { caller ! (url, PageLoader.getPageSize(url)) }
    }

    for (i <- 1 to urls.size) {
        receive {
            case (url, size) => println("Size for " + url + " : " + size )
        }
    }
}

println("Sequential Run ... ")
timeMethod { getPageSizeSequentially }
println("Concurrent Run ... ")
timeMethod { getPageSizeConcurrently }
