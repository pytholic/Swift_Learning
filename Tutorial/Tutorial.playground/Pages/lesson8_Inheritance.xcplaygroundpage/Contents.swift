class Car {
    var top_speed = 200
    
    func drive() {
        print("Driving at \(top_speed)")
    }
}

//class FutureCar {
//    var top_speed = 300
//
//    func drive() {
//        print("Driving at \(top_speed)")
//    }
//
//    func fly() {
//        print("Flying!")
//    }
//}


// redundancy in redifining properties
// use inheritance

class FutureCar : Car {

    override func drive() {
        //super.drive() // to access parent class method
        print("Driving at \(top_speed + 100)")
    }
    
    func fly() {
        print("Flying!")
    }
}



let my_ride = Car()
my_ride.top_speed
my_ride.drive()

let my_new_ride = FutureCar()
my_new_ride.top_speed
my_new_ride.drive()
my_new_ride.fly()
