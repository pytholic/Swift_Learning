import UIKit

var str = "Hello, playground"

print(str)

var a = 1 //var is used for variables
var b = 1
print(a + b)

a = 2 //changes value of var a, no need to write var again
print(a + b)

let c = 10 //for constants we use keyword let, can't change

//str = 29 //gives error
//var temp:Int = "Hello, playground" //error
var temp:String = "hello, playground"

var f:Float = 2.3
var d:Double = 13.9
var e:Bool = true


//CONVERSION among data types
str = String(29) //int converted to string

print(Int(f)) //drops float part
print(Int(d)) //drops float part
print(Int(round(d))) //rounds the number
