//func add_two_numbers() {
//    let a = 1
//    let b = 1
//    let c = a + b
//
//    print(c)
//}
//
//add_two_numbers()

//func add_two_nums() -> Int {
//    let a = 1
//    let b = 2
//    let c = a + b
//    return c
//}
//
//var Sum = add_two_nums()
//print(Sum)

//func add_two_nums(arg para:Int, arg2 para2:Int) -> Int {
////    let a = para
////    let b = para2
//    return para + para2
//}
//
//var Sum = add_two_nums(arg: 2, arg2: 3)
//print(Sum)

//func add_two_nums(para:Int, para2:Int) -> Int {
//    return para + para2
//}
//
//var Sum = add_two_nums(para: 2, para2: 3)
//print(Sum)
// use para as arglabel automatically instead of arg
// arglabels help in understanding

//func add_two_nums(using num1:Int, and num2:Int) -> Int {
////    let a = para
////    let b = para2
//    return num1 + num2
//}
//
//var Sum = add_two_nums(using: 2, and: 3)
//print(Sum)

func add_two_nums(_ num1:Int, _ num2:Int) -> Int {
//    let a = para
//    let b = para2
    return num1 + num2
}

var Sum = add_two_nums(2, 3)
print(Sum)
// special use of "_"


// var defined inside functions have scope only inside the function

