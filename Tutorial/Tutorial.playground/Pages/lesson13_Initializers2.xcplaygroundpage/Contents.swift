class Person {
    var name = ""
}

class BlogPost {
    
    var title:String? // can also use String! here but dangerous, no safety
    var body = "Hey"
    var author:Person?
    var num_comments = 0

    // Designated initializer
    init() {
        title = "My Title"
        author = Person()
    }
    
    convenience init(custom_title:String) {
        self.init() // call designated init inside convenience init
        title = custom_title
    }
}

let post = BlogPost(custom_title: "A Custom Title")

//// Check if there is a value in inside hte optional first
//if let actual_title = post.title {
//
//}
