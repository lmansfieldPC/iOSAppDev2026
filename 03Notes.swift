
// ===== Lesson 3: Arrays ===== //

//An array is a way to store a list of information
var grades = [80, 85, 90]
var hsYears = ["freshman", "sophomore","junior", "senior"]

//This will cause an error because the items must be the same data type.
//var badArray = [75, "hello"]


//We can get things from the array by using an index. We start counting at 0.
print(grades[0])
print(grades[1])
print(grades[2])
//print(grades[3]) //this will cause an error

//We can also use index to change items in the array.
grades[0] = 100
print(grades)

//We can count the number of items
print("There are \(grades.count) grades in the list.")

//We can also add new items.
grades.append(50)
grades.append(60)
print(grades)

//And we can remove items.
grades.remove(at: 0) //gets rid of first item
grades.remove(at: 1) //gets rid of second item
print(grades)

grades.removeAll() //gets rid of everything! notice the empty parantheses
print(grades) 

//We can sort the array
hsYears.sort() 
print(hsYears)

//We can also shuffle the array!
hsYears.shuffle() //Try running a few times
print(hsYears) 


//We can initialize an empty array and add to it.
//We have to tell the computer what type of array it is
var students: [String] = []
students.append("Maddie")
students.append("Carmine")
students.append("Logan")
students.append("Holden")

print(students)
