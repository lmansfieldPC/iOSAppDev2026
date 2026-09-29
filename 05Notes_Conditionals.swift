
// ===== Notes 5: Conditionals ===== //
// A conditional lets the computer make a choice.

//A simple if statement. The code inside the braces only runs
//when the answer is true.
var temp = 90
if temp > 80 {
    print("It's hot out!")
}
/////////////////////////////////////////////////////////////////////////////////
//if and else. One of them always runs.
var score = 65
if score >= 90 {
    print("You did great!")
} else if score >= 70 {
    print("You passed.")
} else {
    print("You did not pass.")
}
/////////////////////////////////////////////////////////////////////////////////
//Now put a conditional inside a function.
func hotOrNot(temp: Int) -> String {
    if temp > 80 {
        return "hot"
    } else {
        return "not hot"
    }
}
print(hotOrNot(temp: 95))
print(hotOrNot(temp: 40))
/////////////////////////////////////////////////////////////////////////////////
//A function can return a Bool.
func canDrive(age: Int) -> Bool {
    if age >= 16 {
        return true
    } else {
        return false
    }
}
print(canDrive(age: 17))
print(canDrive(age: 12))
/////////////////////////////////////////////////////////////////////////////////
//&& means AND. BOTH sides have to be true.
//|| means OR. Only ONE side has to be true.
print(true && false)
print(true || false)

func canRide(age: Int, height: Int) -> Bool {
    if age >= 8 && height >= 48 {
        return true
    } else {
        return false
    }
}
print(canRide(age: 10, height: 50))
print(canRide(age: 10, height: 40))


/////////////////////////////////////////////////////////////////////////////////
// n % 2 == 0  is a way to ask "is n even?"
func isEven(n: Int) -> Bool {
    if n % 2 == 0 {
        return true
    } else {
        return false
    }
}
print(isEven(n: 10))
print(isEven(n: 7))
/////////////////////////////////////////////////////////////////////////////////
//Conditionals work with the arrays we already know.
let students = ["Maddie", "Carmine", "Logan", "Holden"]

func isEmptyList(list: [String]) -> String {
    if list.count == 0 {
        return "The list is empty."
    } else {
        return "The list has \(list.count) items."
    }
}
print(isEmptyList(list: students))
print(isEmptyList(list: []))


