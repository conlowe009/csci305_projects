//***Step One***
////Data class for city entries
data class City(val name: String, val latitude: Double, val longitude: Double)

//City Entries for City Data Class
val cityOne = City("Atlanta", 33.7490, -84.3880)
val cityTwo = City("Bozeman", 45.6770, -111.0429)
val cityThree = City("New York", 40.7128, -74.0060)
val cityFour = City("San Francisco", 37.7749, -122.4194)
val cityFive = City("Tacoma", 47.2529, -122.4443)

//List for city entries
val cityEntries: MutableList<City> = mutableListOf(cityOne, 
                                                   cityTwo, 
                                                   cityThree, 
                                                   cityFour, 
                                                   cityFive)
val cities: List<City> = cityEntries


//Returns all of the cities that have been entered into the list
fun listCities(): List<City> {
    return cities
}

fun distanceFromSeattle(targetCity: City): Double {
    //Hard code seattle city object
    val seattle = City("Seattle", 47.6062, -122.3321)
    //Run distance function between seattle and target city and store result in val
    val kilometers = haversine(seattle.component2(), seattle.component3(),
                              targetCity.component2(), targetCity.component3())
    //Return the distance between cities
    return kilometers
}

//Provided distance function
fun haversine(lat1: Double, lon1: Double, lat2: Double, lon2: Double): Double {    
    val R = 6372.8 // in kilometers    
    val l1 = Math.toRadians(lat1)    
    val l2 = Math.toRadians(lat2)    
    val dl = Math.toRadians(lat2 - lat1)    
    val dr = Math.toRadians(lon2 - lon1)    
    return 2 * R * Math.asin(Math.sqrt(Math.pow(Math.sin(dl / 2), 2.0) + 
            Math.pow(Math.sin(dr / 2), 2.0) * Math.cos(l1) * Math.cos(l2)))
}

//Distance checking function
fun anonymous_function(city: City): Boolean {
	if (distanceFromSeattle(city) > 1000) {
        return true
    }
    else {
        return false
    }
}
	

//Main function
fun main() {
    //List of city locations
    val cityLocations = listCities()
  	
    //***Step Two***
    //Print all city locations 
    cityLocations.forEach {
        i -> println("$i")
    }
    
	//***Step Three***
    //Distance between Seattle and Tacoma
	println("\nThe distance between Seattle and Tacoma is\n" + 
            distanceFromSeattle(cityFive) + " km\n")        
    
    //***Step Four***
    //Uses map function to calculate the distances from Seattle of all cities
    println("A new list with the distances of all cities in list to Seattle:\n" + 
            cityLocations.map{distanceFromSeattle(it)}) 
    
    //***Step Five***
   	val farCities = cityLocations.filter{anonymous_function(it) == true}
    //Print out resulting cities
    println("\nList of cities over 1000km from Seattle")
    farCities.forEach {
        i -> println("${i.component1()}")
    }
    
    //***Step Six***
    val westCities = cityLocations.filter{it.component3() < -89.97803}
    println("\nCites that are west of the Mississippi\n" + westCities.map{it.component1()})
    
    
    //***Step Seven***
	val farthest = cityLocations.maxBy{distanceFromSeattle(it)}
    println("\nMax Distance: " + farthest + "\n")
    
    //***Step Eight***
    val mappedCities = cityLocations.map{it.component1() to it}.toMap()
    //Print all key value pairs in the mapped list
    mappedCities.forEach {
        k, v -> println("Name $k: City $v")
    }
    
    //Print latitude for Bozeman
    if (mappedCities.containsKey("Bozeman")) {
		println("\nThe latitude for Bozeman is " + mappedCities.getValue("Bozeman").component2())
	}
}
