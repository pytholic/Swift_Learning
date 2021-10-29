//class BlogPost {
//
//    var title = ""
//    var body = ""
//    var author = ""
//    var num_comments = 0
//
//}

// what if we want to leave a var empty?

class Person {
    var name = ""
}

class BlogPost {
    
    var title:String? // ? means it can be nil or contain a string
    var body = "Hey"
    var author:Person?
    var num_comments = 0

}

let post = BlogPost()
print(post.body + " hello!")

// before we use optional, we need to check if it has value or not
// Optional binding
post.title = "yo"

// unwrap the optional
if let actual_title = post.title {
    print(actual_title + " salut!")
}
// is pos.title = "", the if block won't execute!

// you can also do force unwrapping and avoid using all that if block
print(post.title! + " salut!")
// ! represents force unwrapping, use it if you know there is a value inside
// gives error if nil

if post.title != nil {
    print(post.title! + " salut!")
}
// Avoids nil error


