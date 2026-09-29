// ===== Notes 4: Functions ===== //
// A function is bit of a code that can be 
// called

//Write a function that prints "Hello"
func sayHello(){
    print("Hello!")
}
//Call the function
sayHello()

//Write a function that takes a parameter name
//and says "Hello, name!"
func greeting(name: String){
    print("Hello, \(name)!")
}
//Call the function
greeting(name: "Laura")



//Write a function that takes two integers as parameters and adds them and returns the sum.
func sum(a: Int, b: Int) -> Int {
    return a + b
}

//Call the function 
print(sum(a: 2, b:4))

//Write a function that returns a person's age in Jan 1 2026 and greets them. The parameters are their name an birth year.
func ageGreeting(name: String, birthYear: Int ) -> Int {
    var years = 2026-birthYear
    print("Hello, \(name). You are \(years) years old.")
    return years
}

ageGreeting(name: "Jim", birthYear: 2000)
var jimsAge = ageGreeting(name: "Jim", birthYear: 2000)
print(jimsAge)


//Write a function that returns the i^th element
//of an array of names
func getElement(names: [String], i: Int) -> String {
    return names[i]
}

print(getElement(names: ["April", "Bob", "Kate"],i: 1))
