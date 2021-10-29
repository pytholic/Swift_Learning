class BlogPost {
    
    var title = ""
    var body = ""
    var author = ""
    var num_comments = 0
    
    func add_comment() {
        num_comments += 1
    }
}

let my_post = BlogPost()
my_post.title = "My blog"
my_post.body = "Hello!"
my_post.author = "trojan"
my_post.add_comment()
print(my_post.num_comments)

let my_second_post = BlogPost()
my_second_post.title = "My blog two"
my_second_post.body = "Hello!"
my_second_post.author = "trojan"
print(my_second_post.num_comments)
