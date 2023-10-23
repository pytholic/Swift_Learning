var x: Int? // may or maynot have a value
var y: Int! // guaranteed to have a value

//x = 10
y = 5

print(x)
print(y)

//if (x != nil)
//{
//    print("x is \(x!)")
//}
//else {
//    print("x is nil")
//}

let final_value = x ?? y // ?? => optional value if nil
print(final_value!)



let fruitlist = ["apples", "oranges", "bananas"]

for fruit in fruitlist
{
   print(fruit)
}

let numbers = 1...10
for num in numbers
{
   print(num)
}

for num in numbers where num % 2 == 0
{
   print(num)
}

// Array
var fruitlist = ["apples", "oranges", "bananas"]
fruitlist.append("strawberry")
fruitlist.remove(at: 0)
print(fruitlist)
print(fruitlist.firstIndex(of: "bananas") ?? "Not found!")
print(fruitlist.firstIndex(of: "apples") ?? "Not found!")

// Set -> cannot have duplicates
var userID : Set = ["111", "112", "113", "111"]
userID.insert("115")
userID.remove("112")
print("User's ID's: ", userID)

// Dict
var items = ["apple": 1, "orange" : 2, "banana": 3]
print(items["apple"] ?? "Does not exist!")
items["strawberry"] = 4
print(items)

// Tuple -> diff datat types
var test = (1, false, "hello", ("abc", "xyz"))
print(test.3.0)
var apple = (foodkind : "Fruit", sugar : 77, isRound : true)
print(apple.isRound)

// Type Casting
var num = "1000"
var res = Int(num) ?? 0
print(res)
var num2 = 1000
var res2 = String(num2) + " hello"
print(res2)

// Funcitons
func sayHello(name: String)
{
   print("Hello \(name)!")
}
sayHello(name: "haseeb")
sayHello(name: "raja")

func addNumebrs(a: Int, b: Int) -> Int
{
   return a+b
}
var res = addNumebrs(a: 2, b: 4)
print(res)

// Guard -> reverse of ifelse
let isConnected = false
func connectToInternet()
{
   guard isConnected else {
       print("There is no internet conneciton...")
       return
   }
   print("There is internet!!!")
}

connectToInternet()



// Regular range
var tenNums = 1...10 // closed range
var fourNums = 1..<5 // half opened range

var numList : [Int] = []

for i in fourNums {
   numList.append(i)
}
print(numList[0..<2])

var negRange = ..<10 // infinite ranges
var posRange = 0...
print(posRange.contains(1000))



// Closures -> no need for keyword while providing arguments
let helloName = { (name: String) in
   print("Hello \(name)")
}
helloName("Haseeb")

let addNumebrs = { (a: Int, b: Int) -> String in
   let value = "The total is \(a+b)"
   return value
}
let res = addNumebrs(2, 4)
print(res)


// Classes
class Car {
//    var carType = "Default"
//    var maxSpeed = 100
//    var fuel = "Diesel"

   var carType : String
   var maxSpeed : Int
   var fuel : String

   init (carType: String, maxSpeed: Int, fuel: String)
   {
       self.carType = carType
       self.maxSpeed = maxSpeed
       self.fuel = fuel

       print("Preparing the \(carType)...")

   }

   convenience init() {
       self.init(carType: "Default", maxSpeed: 100, fuel: "Diesel")
   }

   func describeCar() {
       print("\(carType) runs with \(fuel) at \(maxSpeed) km/h.")
   }
}

//var tesla = Car()
//tesla.fuel = "Electric"
//tesla.carType = "Tesla"
//tesla.maxSpeed = 320
//tesla.describeCar()
//
//var regularCar = Car()
//regularCar.describeCar()

var tesla = Car(carType: "Tesla", maxSpeed: 320, fuel: "Electric")
tesla.describeCar()
var regularCar = Car()
regularCar.describeCar()

// Enum
enum Condition {
   case perfect, good, bad
}


var currCondition = Condition.good
switch (currCondition) {
case  .good:
   print("Condition is good")
case .perfect:
   print("Condition is perfect")
case .bad:
   print("Condition is bad")
}
