class Person {
    var name = ""
}

class BlogPost {
    
    var title:String?
    var body = "Hey"
    var author:Person?
    var num_comments = 0

    // Computer property
    var full_title:String {
        
        // Check if title and authro are not nil
        if title != nil && author != nil {
            return title! + " by " + author!.name
        }
        else if title != nil {
            return title!
        }
        else {
            return "No title!"
        }
        
    }
    
    
    
//    // can access properties inside functions
//    func ad_comment(){
//
//        print(body)
//
//    }
//
//    func share_article() {
//
//        print(body)
//
//    }
//
//    func add_comment_counts() -> Int {
//        // Do some calculations
//        // Arrive at a result
//
//        //num_comments = answer// assign answer to property, we can use it later
//    }
}

//let myPost = BlogPost()
//myPost.title = "Title of the post"
//myPost.title
//
//let myPost2 = BlogPost()
//myPost2.title = "Another title"
//myPost2.title

// Properties are variables attached to BlogPost objects that we create

let author = Person()
author.name = "trojan"

let myPost = BlogPost()
myPost.author = author
myPost.title = "Learn Swift for Beginners"
print(myPost.full_title)
