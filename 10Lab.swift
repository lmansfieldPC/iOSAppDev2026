
// ===== Extra Function Practice =====
//
// Ten functions to write. Each one is a STUB. It returns a fake
// answer so this file will run.
//
// Run it right now. Every test will say FAIL.
// Replace each fake answer with real code. Its tests turn to PASS.
// Your goal is all PASS.
//
// No loops needed. Everything here uses variables, arrays,
// if / else, and %.


// ==========================================================
// 1. secondsToTime
//
// Turn a number of seconds into a clock time.
// Seconds under 10 need a zero in front, or 605 comes out
// as 10:5 instead of 10:05.
//
//   225  ->  "3:45"
//   60   ->  "1:00"
//   45   ->  "0:45"
//   605  ->  "10:05"
// ==========================================================

func secondsToTime(seconds: Int) -> String {
    return ""           // TODO: replace this
}


// ==========================================================
// 2. tipAmount
//
// Work out the tip on a bill.
// The percent comes in as a whole number.
//
//   50.0,  20  ->  10.0
//   24.0,  15  ->  3.6
//   100.0, 10  ->  10.0
// ==========================================================

func tipAmount(bill: Double, percent: Int) -> Double {
    return 0.0          // TODO: replace this
}


// ==========================================================
// 3. isTeen
//
// True if someone is 13 through 19.
//
//   13  ->  true
//   19  ->  true
//   12  ->  false
//   20  ->  false
// ==========================================================

func isTeen(age: Int) -> Bool {
    return false        // TODO: replace this
}


// ==========================================================
// 4. whichIsLonger
//
// Return whichever word has more letters.
// If they tie, return the first one.
// word.count gives a string's length.
//
//   "cat", "horse"     ->  "horse"
//   "elephant", "ox"   ->  "elephant"
//   "dog", "pig"       ->  "dog"
// ==========================================================

func whichIsLonger(a: String, b: String) -> String {
    return ""           // TODO: replace this
}


// ==========================================================
// 5. howManyLeft
//
// How many are left after some get used.
// It can never go below zero.
//
//   10, 3   ->  7
//   10, 10  ->  0
//   10, 15  ->  0
// ==========================================================

func howManyLeft(total: Int, used: Int) -> Int {
    return 0            // TODO: replace this
}


// ==========================================================
// 6. shippingCost
//
// Shipping is free on orders of 50.00 or more.
// Otherwise it is 5.99.
//
//   75.0   ->  0.0
//   50.0   ->  0.0
//   49.99  ->  5.99
//   10.0   ->  5.99
// ==========================================================

func shippingCost(subtotal: Double) -> Double {
    return 0.0          // TODO: replace this
}


// ==========================================================
// 7. biggestOfThree
//
// Return the largest of three numbers. 
//
//   3, 9, 5  ->  9
//   9, 3, 5  ->  9
//   3, 5, 9  ->  9
//   7, 7, 2  ->  7
// ==========================================================

func biggestOfThree(a: Int, b: Int, c: Int) -> Int {
    return 0          // TODO: replace this 
}


// ==========================================================
// 8. timeOfDay
//
// Turn an hour on a 24-hour clock into a word.
//
//   under 12    ->  "morning"
//   12 to 16    ->  "afternoon"
//   17 to 20    ->  "evening"
//   21 and up   ->  "night"
// ==========================================================

func timeOfDay(hour: Int) -> String {
    return ""          // TODO: replace this
      
}


// ==========================================================
// 9. fizz
//
// The classic.
//
//   divides evenly by 3 AND 5  ->  "FizzBuzz"
//   divides evenly by 3        ->  "Fizz"
//   divides evenly by 5        ->  "Buzz"
//   anything else              ->  the number itself, as text
//
//   3   ->  "Fizz"
//   5   ->  "Buzz"
//   15  ->  "FizzBuzz"
//   7   ->  "7"
// ==========================================================

func fizz(n: Int) -> String {
    return ""          // TODO: replace this
}


// ==========================================================
// 10. swapEnds
//
// Return a NEW array with the first and last items switched.
// Everything in the middle stays put.
//
// You cannot change the array that gets handed to you,
// so make a var copy of it first.
//
//   ["a", "b", "c", "d"]  ->  ["d", "b", "c", "a"]
//   ["x", "y"]            ->  ["y", "x"]
//   ["solo"]              ->  ["solo"]
// ==========================================================

func swapEnds(list: [String]) -> [String] {
    return []           // TODO: replace this
}


// ==========================================================
// TESTS - do not change anything below this line
// ==========================================================

func testInt(label: String, got: Int, want: Int) {
    if got == want {
        print("PASS  \(label)")
    } else {
        print("FAIL  \(label)   got \(got), expected \(want)")
    }
}

func testString(label: String, got: String, want: String) {
    if got == want {
        print("PASS  \(label)")
    } else {
        print("FAIL  \(label)   got \"\(got)\", expected \"\(want)\"")
    }
}

func testBool(label: String, got: Bool, want: Bool) {
    if got == want {
        print("PASS  \(label)")
    } else {
        print("FAIL  \(label)   got \(got), expected \(want)")
    }
}

func testDouble(label: String, got: Double, want: Double) {
    if abs(got - want) < 0.001 {
        print("PASS  \(label)")
    } else {
        print("FAIL  \(label)   got \(got), expected \(want)")
    }
}

func testArray(label: String, got: [String], want: [String]) {
    if got == want {
        print("PASS  \(label)")
    } else {
        print("FAIL  \(label)   got \(got), expected \(want)")
    }
}

print("")
print("===== 1. secondsToTime =====")
testString(label: "225", got: secondsToTime(seconds: 225), want: "3:45")
testString(label: "60",  got: secondsToTime(seconds: 60),  want: "1:00")
testString(label: "45",  got: secondsToTime(seconds: 45),  want: "0:45")
testString(label: "605", got: secondsToTime(seconds: 605), want: "10:05")
testString(label: "0",   got: secondsToTime(seconds: 0),   want: "0:00")

print("")
print("===== 2. tipAmount =====")
testDouble(label: "50 at 20%",  got: tipAmount(bill: 50.0,  percent: 20), want: 10.0)
testDouble(label: "24 at 15%",  got: tipAmount(bill: 24.0,  percent: 15), want: 3.6)
testDouble(label: "100 at 10%", got: tipAmount(bill: 100.0, percent: 10), want: 10.0)
testDouble(label: "0 at 20%",   got: tipAmount(bill: 0.0,   percent: 20), want: 0.0)

print("")
print("===== 3. isTeen =====")
testBool(label: "13", got: isTeen(age: 13), want: true)
testBool(label: "19", got: isTeen(age: 19), want: true)
testBool(label: "16", got: isTeen(age: 16), want: true)
testBool(label: "12", got: isTeen(age: 12), want: false)
testBool(label: "20", got: isTeen(age: 20), want: false)

print("")
print("===== 4. whichIsLonger =====")
testString(label: "cat, horse",   got: whichIsLonger(a: "cat", b: "horse"),   want: "horse")
testString(label: "elephant, ox", got: whichIsLonger(a: "elephant", b: "ox"), want: "elephant")
testString(label: "dog, pig",     got: whichIsLonger(a: "dog", b: "pig"),     want: "dog")

print("")
print("===== 5. howManyLeft =====")
testInt(label: "10 minus 3",  got: howManyLeft(total: 10, used: 3),  want: 7)
testInt(label: "10 minus 10", got: howManyLeft(total: 10, used: 10), want: 0)
testInt(label: "10 minus 15", got: howManyLeft(total: 10, used: 15), want: 0)
testInt(label: "0 minus 5",   got: howManyLeft(total: 0,  used: 5),  want: 0)

print("")
print("===== 6. shippingCost =====")
testDouble(label: "75.00", got: shippingCost(subtotal: 75.0),  want: 0.0)
testDouble(label: "50.00", got: shippingCost(subtotal: 50.0),  want: 0.0)
testDouble(label: "49.99", got: shippingCost(subtotal: 49.99), want: 5.99)
testDouble(label: "10.00", got: shippingCost(subtotal: 10.0),  want: 5.99)

print("")
print("===== 7. biggestOfThree =====")
testInt(label: "3, 9, 5", got: biggestOfThree(a: 3, b: 9, c: 5), want: 9)
testInt(label: "9, 3, 5", got: biggestOfThree(a: 9, b: 3, c: 5), want: 9)
testInt(label: "3, 5, 9", got: biggestOfThree(a: 3, b: 5, c: 9), want: 9)
testInt(label: "7, 7, 2", got: biggestOfThree(a: 7, b: 7, c: 2), want: 7)
testInt(label: "4, 4, 4", got: biggestOfThree(a: 4, b: 4, c: 4), want: 4)

print("")
print("===== 8. timeOfDay =====")
testString(label: "0",  got: timeOfDay(hour: 0),  want: "morning")
testString(label: "8",  got: timeOfDay(hour: 8),  want: "morning")
testString(label: "11", got: timeOfDay(hour: 11), want: "morning")
testString(label: "12", got: timeOfDay(hour: 12), want: "afternoon")
testString(label: "16", got: timeOfDay(hour: 16), want: "afternoon")
testString(label: "17", got: timeOfDay(hour: 17), want: "evening")
testString(label: "20", got: timeOfDay(hour: 20), want: "evening")
testString(label: "21", got: timeOfDay(hour: 21), want: "night")
testString(label: "23", got: timeOfDay(hour: 23), want: "night")

print("")
print("===== 9. fizz =====")
testString(label: "3",  got: fizz(n: 3),  want: "Fizz")
testString(label: "9",  got: fizz(n: 9),  want: "Fizz")
testString(label: "5",  got: fizz(n: 5),  want: "Buzz")
testString(label: "10", got: fizz(n: 10), want: "Buzz")
testString(label: "15", got: fizz(n: 15), want: "FizzBuzz")
testString(label: "30", got: fizz(n: 30), want: "FizzBuzz")
testString(label: "7",  got: fizz(n: 7),  want: "7")
testString(label: "1",  got: fizz(n: 1),  want: "1")

print("")
print("===== 10. swapEnds =====")
testArray(label: "4 items", got: swapEnds(list: ["a", "b", "c", "d"]), want: ["d", "b", "c", "a"])
testArray(label: "2 items", got: swapEnds(list: ["x", "y"]),           want: ["y", "x"])
testArray(label: "1 item",  got: swapEnds(list: ["solo"]),             want: ["solo"])
