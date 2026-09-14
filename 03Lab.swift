// ===== Lab 3: Arrays =====
// Type your answers under each problem.
// Run your code after every problem. Do not wait until the end.


// Part 1: Predict, then run ////////////////////////////////
// Before running anything, write your prediction as a comment
// next to each print. Then run it and check.

var nums = [10, 20, 30, 40]
print(nums[1])            // my prediction:

nums[1] = 99
print(nums)               // my prediction:

print(nums.count)         // my prediction:

nums.append(50)
print(nums.count)         // my prediction:

var letters = ["a", "b", "c", "d"]
letters.remove(at: 0)
letters.remove(at: 1)
print(letters)            // my prediction:

var team = ["Zoe", "Alex", "Maddie"]
team.sort()
print(team[0])            // my prediction:

var empty = [1, 2, 3]
empty.removeAll()
print(empty.count)        // my prediction:


// Part 2: Fix the broken code //////////////////////////////
// Each of these has one mistake.
// They are commented out so the file will run.
// Uncomment ONE problem at a time, fix it, run it, then move on.
// Write a comment saying what was wrong.

// Problem 1
// let colors = ["red", "blue"]
// colors.append("green")
// print(colors)

// Problem 2
// var scores = [90, 85, 100]
// print(scores[3])

// Problem 3
// var lunch = [75, "chips"]
// print(lunch)

// Problem 4
// var pets = ["dog", "cat", "fish"]
// pets.remove(1)
// print(pets)

// Problem 5
// var names = []
// names.append("Hello Kitty")
// print(names)


// Part 3: Write your own ///////////////////////////////////

// Problem 6
// Create an array called classes holding four courses you take.
// Print the whole array.
// Then print just the third course.


// Problem 7
// Print a sentence using string interpolation that says how many
// courses are in your array. It should look like:
// I have 4 courses.


// Problem 8
// Add a fifth course to classes. Print the array again.


// Problem 9
// Change the first course in classes to "Study Hall".
// Print the array.


// Problem 10
// Remove the last course from classes using remove(at:).


// Problem 11
// Create an EMPTY array of type [Int] called lockerNumbers.
// Append four locker numbers to it.
// Print the array and print how many items are in it.


// Problem 12
// Shuffle lockerNumbers and print it.
// Then sort it and print it again.


// Problem 13: Rotate ///////////////////////////////////////
// Move the FIRST item of the array to the END,
// so lineUp becomes ["Carmine", "Logan", "Holden", "Maddie"].
// You may only use remove(at:), append(), and index access.
// Hint: you will lose the name once you remove it, so save it
// in a variable first.

var lineUp = ["Maddie", "Carmine", "Logan", "Holden"]

// YOUR CODE HERE

print(lineUp)     // should print ["Carmine", "Logan", "Holden", "Maddie"]


