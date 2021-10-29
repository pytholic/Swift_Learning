//var car_db = Dictionary<String, String> ()

// Declaring new dict
var car_db = [String:String]() //dict // compact way
var f: [String:String] = [:]
//var array = [String]() // array

// Adding key value pair
car_db["JSD 238"] = "Blue Ferrari"
car_db["SID 482"] = "Green Toyota"
// Retrieving data
//print(car_db["JSD 238"]!) // unwrap it

// Update a value for a key
car_db["JSD 238"] = "Red Ferrari"

// Remove a key-value pair
//Car_db["JSD 238"] = nil

// How to iterate
for (license, car) in car_db {
    print("\(car) has a licence number \(license)")
}
