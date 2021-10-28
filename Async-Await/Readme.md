# Async await in Swift

## General Description
Basically, this is a new way to write async code, which were traditionally written by using `Completion Handlers`. It is introduced in **WWDC2021** along with **Swift 5.5**.

## Why did Apple go and create this?

### Traditional Way
Traditionally, if we wanted to do an `Async` operation, you generally add a `closure`, `completion handler`, or a `callback` (kind of names of same thing) to a function.

#### Example
Lets say we had a function to fetch users. Generally this fetch users function would take some sort of comepletion handler that would maybe hand back the name of the users and returning void.

```
func fetchUsers (completion: ([String] -> Void) { 

}
```

This function itself wouldn't have nay `return` signature. However, once you have a lot of asynchronous operation that are nested, you quickly get into syntax that looks something like:

```
calss ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchUsers { users in
      fetchPhotos (for: usewrs) { data in
        ///
      }
     }
    }
    
    func fetchUsers (completion: ([String] -> Void) { 
    }
 }
```

This gets a little ugly and it is not really easy for the Swift compiler to check if there is anything weird going on in terms of any bugs introduced into your code. 
