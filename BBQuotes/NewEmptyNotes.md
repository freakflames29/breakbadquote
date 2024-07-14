# String extention

we have used the name.replaceoccurence of function directly into our code and it will create a lot of mess if our code gets bigger and also not focusing on dry principle 
so for that we can extend a string function and add our custom method in string module.

```swift
extention String {
   func replaceSpaces() -> String {
        return self.replacingOccurrences(of: " ", with: "")
   
    } 
    
    
}
```

now in our code we can use that by
`vm.name.replaceSpaces() `

