# Async await in Swift

## General Description
Basically, this is a new way to write async code, which were traditionally written by using `Completion Handlers`. It is introduced in **WWDC2021** along with **Swift 5.5**.

## Why did Apple go and create this?

### Traditional Way
Traditionally, if we wanted to do an `Async` operation, you generally add a `closure`, `completion handler`, or a `callback` (kind of names of same thing) to a function.
