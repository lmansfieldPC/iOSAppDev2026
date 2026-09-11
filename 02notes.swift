// ===== Lesson 2: String Interpolation and Data Types=====//

//====String Interpolation====//
//Often we want to string different words and values together.
//We can use "string interpolation" to add variable values so the user can see them.

var score = 10
print("Your score is \(score).")
score = score * 20
print("Your score is \(score).")

var name = "Laura"
var age = 39
var inTenYears = age + 39

print("My name is \(name). I am \(age) years old. In ten years, I will be \(inTenYears).")

//====Variable Types====//
//Sometimes we need to specify what type of variable we have.
//There are 4 types.
var points: Int = 10
var price: Double = 4.99
var passing: Bool = false
var mascot: String = "Quaker"

//Why do we need types?
var num1 = 12
print(num1/5) //This will give 2. 

var num2: Double = 12
print(num2/5) //This will give 2.4

var num3 = 12.0
print(num1/5) //This will give 2.4. 

var num4: Int = 12
//print(num1/5.0) //This will cause an error

var winning: Bool = true
//winning = 10 //This will cause an error.

var firstName = "Hello"
var lastName = "Kitty"
var wholeName = firstName + " " + lastName
print(wholeName)

//====Compound Operators====//
var start: Double = 12
start += 10  //now its 22.0
start *= 2  //now its 44.0
start /= 4  //now its 11.0
print(start)

//====Comparison Operators====//
print(2 < 5) //true
print(5 >= 2) //true
print(2 == 5) //false
print(5 == 5) //true
print(5.0 == 5) //true
print(2 != 5 ) //true
print("three"=="Three") //false

var testScore = 72
print(testScore > 70)  //true

