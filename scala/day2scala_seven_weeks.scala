import scala.collection.mutable.HashMap // need this for question 3

/*** exercise 1, Day 2, page 153 -- Use foldLeft to compute the total size of a list of strings */

object Folding {

    val list = List("hello", "I", "said", "to", "the", "man")

    def getLength:Int = {
        
        list.foldLeft(0)((tot_length, str) => tot_length + str.length())
    }
}

println("QUESTION 1")
println(Folding.getLength)

/*** exercise 2, Day 2, page 153 -- Write a censor trait with a method that will replace the curse words. */

// only have two definitions of censor as I don't know polymorphism
trait CensorFuncs {
    // Functions map through the list: if word is not in the map then use the word, else apply the map
    def censor(list_to_censor:List[String], censor_map:Map[String, String]) = list_to_censor.map(word => if(censor_map.get(word) == None) {word} else censor_map(word))

    def censor_hashmap(list_to_censor:List[String], censor_map:HashMap[String, String]) = list_to_censor.map(word => if(censor_map.get(word) == None) {word} else censor_map(word)) 
}

class CensorList extends CensorFuncs

val cList = new CensorList

val censored_list = cList.censor(List("Shoot", "that", "is", "expensive", "Darn"), Map("Shoot"->"Pucky", "Darn"->"Beans"))

println("QUESTION 2")
println(censored_list)

/*** exercise 3, Day 2, page 153 -- read censor map from file. */

val censor_map_from_file = new HashMap[String, String]
val fileLines = scala.io.Source.fromFile("censor_list.txt").getLines.toList // read in file
val splitLines = fileLines.map( line => line.split(",")).tail               // split each line into the key and val pairs of the Map, ignore head list as col headers
splitLines.foreach(line => censor_map_from_file += line{0} -> line{1})      // assign the key and val pairs to the Map

val cListFromFile = new CensorList

val censored_list_read_from_file = cListFromFile.censor_hashmap(List("Shoot", "that", "is", "expensive", "Darn", "I", "really", "think", "so", "Shoot"), censor_map_from_file)

println("QUESTION 3")
println(censored_list_read_from_file)