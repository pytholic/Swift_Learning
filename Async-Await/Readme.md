# Async await in Swift

## General Description
Async await is part of the new structured concurrency changes that arrived in **Swift 5.5** during **WWDC 2021**. Basically, this is a new way to write async code, which were traditionally written by using `Completion Handlers`. Concurrency in Swift means allowing multiple pieces of code to run at the same time. This is a very simplified description, but it should give you an idea already how important concurrency in Swift is for the performance of your apps. 

## What is Async?
`Async` stands for asynchronous and can be seen as a method attribute making it clear that a method performs asynchronous work. An example of such a method looks as follows:

```swift
func fetchImages() async throws -> [UIImage] {
    // .. perform data request
}
```
The `fetchImages` method is defined as async throwing, which means that it’s performing a failable asynchronous job. The method would return a collection of images if everything went well or throws an error if something went wrong.

## How async replaces closure completion callbacks
Async methods replace the often seen closure completion callbacks. Completion callbacks were common in Swift to return from an asynchronous task, often combined with a Result type parameter. The above method would have been written as followed:

```swift
func fetchImages(completion: (Result<[UIImage], Error>) -> Void) {
    // .. perform data request
}
```

This gets a little ugly and it is not really easy for the Swift compiler to check if there is anything weird going on in terms of any bugs introduced into your code. 

Defining a method using a `completion closure` is still possible in Swift today, but it has a few downsides that are solved by using async instead:

* You have to make sure yourself to call the completion closure in each possible method exit. Not doing so will possibly result in an app waiting for a result endlessly.
* Closures are harder to read. It’s not as easy to reason about the order of execution as compared to how easy it is with structured concurrency.
* Retain cycles need to be avoided using weak references.
* Implementors need to switch over the result to get the outcome. It’s not possible to use try catch statements from the implementation level.

These downsides are based on the closure version using the relatively new `Result` enum. It’s likely that a lot of projects still make use of completion callbacks without this enumeration:

```swift
func fetchImages(completion: ([UIImage]?, Error?) -> Void) {
    // .. perform data request
}
```
Defining a method like this makes it even harder to reason about the outcome on the caller’s side. Both value and error are optional, which requires us to perform an unwrap in any case. Unwrapping these optionals results in more code clutter which does not help to improve readability.

## What is await?
`Await` is the keyword to be used for calling async methods. You can see them as best friends in Swift as one will never go without the other. We could take a look at an example by calling our earlier defined async throwing fetch images method:

```swift
do {
    let images = try await fetchImages()
    print("Fetched \(images.count) images.")
} catch {
    print("Fetching images failed with error \(error)")
}
```

It might be hard to believe, but the above code example is performing an asynchronous task. Using the await keyword, we tell our program to await a result from the `fetchImages` method and only continue after a result arrived. This could either be a collection of images or an error if anything went wrong while fetching the images.

## What is structured concurrency
Structured concurrency with async-await method calls makes it easier to reason about the order of execution. Methods are linearly executed without going back and forth like you would with closures. 

### Traditional Way
To explain this better, we can look at how we would call the above code example before structured concurrency arrived. Traditionally, if we wanted to do an `Async` operation, you generally add a `closure`, `completion handler`, or a `callback` (kind of names of same thing) to a function.

```swift
// 1. Call the method
fetchImages { result in
    // 3. The asynchronous method returns
    switch result {
    case .success(let images):
        print("Fetched \(images.count) images.")
    case .failure(let error):
        print("Fetching images failed with error \(error)")
    }
}
// 2. The calling method exits
```

As you can see, the calling method returns before the images are fetched. Eventually, a result is received, and we go back into our flow within the completion callback. This is an unstructured order of execution and can be hard to follow. This is especially true if we would perform another asynchronous method within our completion callback which would add another closure callback:

```swift
// 1. Call the method
fetchImages { result in
    // 3. The asynchronous method returns
    switch result {
    case .success(let images):
        print("Fetched \(images.count) images.")
        
        // 4. Call the resize method
        resizeImages(images) { result in
            // 6. Resize method returns
            switch result {
            case .success(let images):
                print("Decoded \(images.count) images.")
            case .failure(let error):
                print("Decoding images failed with error \(error)")
            }
        }
        // 5. Fetch images method returns
    case .failure(let error):
        print("Fetching images failed with error \(error)")
    }
}
// 2. The calling method exits
```

Each closure adds another level of indentation, which makes it harder to follow the order of execution.

### Async await method
Rewriting the above code example by making use of `async-await` explains best what structured concurrency does:

```swift
do {
    // 1. Call the method
    let images = try await fetchImages()
    // 2. Fetch images method returns
    
    // 3. Call the resize method
    let resizedImages = try await resizeImages(images)
    // 4. Resize method returns
    
    print("Fetched \(images.count) images.")
} catch {
    print("Fetching images failed with error \(error)")
}
// 5. The calling method exits
```

The order of execution is linear and, therefore, easy to follow and easy to reason about. Understanding asynchronous code will be easier while we’re still performing sometimes complex asynchronous tasks.

## Async methods call in a function that does not support concurrenc
While using async-await for the first time, you might run into an error like

```swift
func fetchData() {
    do {
        try await fetchImages()
    } catch {
        // .. handle error
    }
}
```

```
‘async’ call in a function that does not support concurrency.
```

This error occurs as we try to call an asynchronous method from a synchronous calling environment that does not support concurrency. We can solve this error by either defining our `fetchData` method as async as well:

```swift
func fetchData() async {
    do {
        try await fetchImages()
    } catch {
        // .. handle error
    }
}
```

However, this would move the error to a different place. Instead, we could use the `Task.init` method to call the asynchronous method from a new task that does support concurrency and assign the outcome result to a property in our view model:

```swift
final class ContentViewModel: ObservableObject {
    
    @Published var images: [UIImage] = []
    
    func fetchData() {
        Task.init {
            do {
                self.images = try await fetchImages()
            } catch {
                // .. handle error
            }
        }
    }
}
```

Using the async method using the trailing closure, we create an environment in which we can call asynchronous methods. The fetch data method returns as soon as the async method is called, after which all asynchronous callbacks will happen within the closure.
