var some_char:Character = "c"

//if some_char == "a" {
//    print("is an a")
//}

switch some_char {
    case "a":
        print("is an a")
    case "b", "c": // two cases combined
        print("is a b or c")
    default:
        print("some fallback")
}

// switch is easier and compact to eye compared to if-else
