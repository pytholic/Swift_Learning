class Person {
    
    var name = ""
    var age = 0

    init() {
        
    }
    
    init(_ name:String, _ age:Int) {
        // Set up your object
        // use self to remove ambiguity
        // self refers to the new variable being created
        self.name = name
        self.age = age
    }
}

var a = Person("trojan", 24)
a.name
a.age

var b = Person() //refers to first init
b.name
b.age

