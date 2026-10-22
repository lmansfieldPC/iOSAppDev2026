
// ===== Function Practice 3 =====
//
// Ten functions to write. Each one is a STUB. It returns a fake
// answer so this file will run.
//
// Run it right now. Every test will say FAIL.
// Replace each fake answer with real code. Its tests turn to PASS.
// Your goal is all PASS.
//
// No loops needed. Everything here uses variables, arrays,
// if / else, && , || , and %.


// ==========================================================
// 1. isWeekend
//
// True if the day is Saturday or Sunday.
//
//   "Saturday"  ->  true
//   "Sunday"    ->  true
//   "Monday"    ->  false
//   "Friday"    ->  false
// ==========================================================

func isWeekend(day: String) -> Bool {
    return false        // TODO: replace this
}


// ==========================================================
// 2. averageOf
//
// The average of three whole numbers.
//
// Careful: the answer has decimals, but the three numbers
// coming in are Ints. Int divided by Int throws the decimals
// away, so 4 / 3 would come out as 1 instead of 1.333.
//
//   2, 3, 4    ->  3.0
//   1, 1, 2    ->  1.3333
//   10, 15, 20 ->  15.0
// ==========================================================

func averageOf(a: Int, b: Int, c: Int) -> Double {
    return 0.0          // TODO: replace this
}


// ==========================================================
// 3. passwordStrength
//
// Rate a password by how many letters it has.
//
//   under 6    ->  "weak"
//   6 to 9     ->  "okay"
//   10 and up  ->  "strong"
//
//   "cat"         ->  "weak"
//   "abcdef"      ->  "okay"
//   "abcdefghij"  ->  "strong"
// ==========================================================

func passwordStrength(password: String) -> String {
    return ""           // TODO: replace this
}


// ==========================================================
// 4. roundToNearestTen
//
// Round a number to the closest ten.
// A 5 in the ones place rounds up.
//
// Use % to find out how far past a ten the number is.
//
//   47  ->  50
//   42  ->  40
//   45  ->  50
//   40  ->  40
//   3   ->  0
// ==========================================================

func roundToNearestTen(n: Int) -> Int {
    return 0            // TODO: replace this
}


// ==========================================================
// 5. canAfford
//
// True if the money in the wallet covers the price.
// A coupon takes 20 percent off first.
//
// Taking 20 percent off is the same as keeping 80 percent.
//
//   50.0,  45.0, true   ->  true     (the coupon makes it 40.00)
//   50.0,  45.0, false  ->  false
//   20.0,  20.0, false  ->  true
//   100.0, 79.0, true   ->  false    (the coupon makes it 80.00)
// ==========================================================

func canAfford(price: Double, wallet: Double, hasCoupon: Bool) -> Bool {
    return false        // TODO: replace this
}


// ==========================================================
// 6. batteryStatus
//
// Turn a battery percent into a word.
//
//   80 and up  ->  "Full"
//   40 to 79   ->  "Good"
//   15 to 39   ->  "Low"
//   under 15   ->  "Critical"
// ==========================================================

func batteryStatus(percent: Int) -> String {
    return ""           // TODO: replace this
}


// ==========================================================
// 7. whichQuarter
//
// Which quarter of the year a month falls in.
//
//   months 1 to 3    ->  1
//   months 4 to 6    ->  2
//   months 7 to 9    ->  3
//   months 10 to 12  ->  4
// ==========================================================

func whichQuarter(month: Int) -> Int {
    return 0            // TODO: replace this
}


// ==========================================================
// 8. scoreboard
//
// Say who won and by what score.
// The WINNER'S score always comes first.
// If it is a tie, say so instead.
//
//   21, 14  ->  "Home wins 21 to 14"
//   14, 21  ->  "Away wins 21 to 14"
//   14, 14  ->  "Tied at 14"
// ==========================================================

func scoreboard(home: Int, away: Int) -> String {
    return ""           // TODO: replace this
}


// ==========================================================
// 9. sameFirstAndLast
//
// True if the first item and the last item match.
// A list with one item counts as true, because the first
// item IS the last item.
//
//   ["a", "b", "a"]  ->  true
//   ["a", "b", "c"]  ->  false
//   ["solo"]         ->  true
// ==========================================================

func sameFirstAndLast(list: [String]) -> Bool {
    return false        // TODO: replace this
}


// ==========================================================
// 10. dropFirst
//
// Return a NEW array with the first item taken off.
// You can assume the list has at least one item.
//
// You cannot change the array that gets handed to you,
// so make a var copy of it first.
//
//   ["a", "b", "c"]  ->  ["b", "c"]
//   ["x", "y"]       ->  ["y"]
//   ["only"]         ->  []
// ==========================================================

func dropFirst(list: [String]) -> [String] {
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
print("===== 1. isWeekend =====")
testBool(label: "Saturday", got: isWeekend(day: "Saturday"), want: true)
testBool(label: "Sunday",   got: isWeekend(day: "Sunday"),   want: true)
testBool(label: "Monday",   got: isWeekend(day: "Monday"),   want: false)
testBool(label: "Friday",   got: isWeekend(day: "Friday"),   want: false)

print("")
print("===== 2. averageOf =====")
testDouble(label: "2, 3, 4",    got: averageOf(a: 2,  b: 3,  c: 4),  want: 3.0)
testDouble(label: "1, 1, 2",    got: averageOf(a: 1,  b: 1,  c: 2),  want: 1.3333)
testDouble(label: "10, 15, 20", got: averageOf(a: 10, b: 15, c: 20), want: 15.0)
testDouble(label: "0, 0, 1",    got: averageOf(a: 0,  b: 0,  c: 1),  want: 0.3333)

print("")
print("===== 3. passwordStrength =====")
testString(label: "cat (3)",          got: passwordStrength(password: "cat"),          want: "weak")
testString(label: "abcde (5)",        got: passwordStrength(password: "abcde"),        want: "weak")
testString(label: "abcdef (6)",       got: passwordStrength(password: "abcdef"),       want: "okay")
testString(label: "abcdefghi (9)",    got: passwordStrength(password: "abcdefghi"),    want: "okay")
testString(label: "abcdefghij (10)",  got: passwordStrength(password: "abcdefghij"),   want: "strong")
testString(label: "longer one",       got: passwordStrength(password: "purplecaterpillar"), want: "strong")

print("")
print("===== 4. roundToNearestTen =====")
testInt(label: "47", got: roundToNearestTen(n: 47), want: 50)
testInt(label: "42", got: roundToNearestTen(n: 42), want: 40)
testInt(label: "45", got: roundToNearestTen(n: 45), want: 50)
testInt(label: "40", got: roundToNearestTen(n: 40), want: 40)
testInt(label: "8",  got: roundToNearestTen(n: 8),  want: 10)
testInt(label: "3",  got: roundToNearestTen(n: 3),  want: 0)

print("")
print("===== 5. canAfford =====")
testBool(label: "50, 45, coupon",     got: canAfford(price: 50.0,  wallet: 45.0, hasCoupon: true),  want: true)
testBool(label: "50, 45, no coupon",  got: canAfford(price: 50.0,  wallet: 45.0, hasCoupon: false), want: false)
testBool(label: "20, 20, no coupon",  got: canAfford(price: 20.0,  wallet: 20.0, hasCoupon: false), want: true)
testBool(label: "100, 79, coupon",    got: canAfford(price: 100.0, wallet: 79.0, hasCoupon: true),  want: false)
testBool(label: "100, 80, coupon",    got: canAfford(price: 100.0, wallet: 80.0, hasCoupon: true),  want: true)

print("")
print("===== 6. batteryStatus =====")
testString(label: "100", got: batteryStatus(percent: 100), want: "Full")
testString(label: "80",  got: batteryStatus(percent: 80),  want: "Full")
testString(label: "79",  got: batteryStatus(percent: 79),  want: "Good")
testString(label: "40",  got: batteryStatus(percent: 40),  want: "Good")
testString(label: "39",  got: batteryStatus(percent: 39),  want: "Low")
testString(label: "15",  got: batteryStatus(percent: 15),  want: "Low")
testString(label: "14",  got: batteryStatus(percent: 14),  want: "Critical")
testString(label: "0",   got: batteryStatus(percent: 0),   want: "Critical")

print("")
print("===== 7. whichQuarter =====")
testInt(label: "January (1)",   got: whichQuarter(month: 1),  want: 1)
testInt(label: "March (3)",     got: whichQuarter(month: 3),  want: 1)
testInt(label: "April (4)",     got: whichQuarter(month: 4),  want: 2)
testInt(label: "June (6)",      got: whichQuarter(month: 6),  want: 2)
testInt(label: "July (7)",      got: whichQuarter(month: 7),  want: 3)
testInt(label: "September (9)", got: whichQuarter(month: 9),  want: 3)
testInt(label: "October (10)",  got: whichQuarter(month: 10), want: 4)
testInt(label: "December (12)", got: whichQuarter(month: 12), want: 4)

print("")
print("===== 8. scoreboard =====")
testString(label: "21 to 14", got: scoreboard(home: 21, away: 14), want: "Home wins 21 to 14")
testString(label: "14 to 21", got: scoreboard(home: 14, away: 21), want: "Away wins 21 to 14")
testString(label: "14 to 14", got: scoreboard(home: 14, away: 14), want: "Tied at 14")
testString(label: "3 to 0",   got: scoreboard(home: 3,  away: 0),  want: "Home wins 3 to 0")
testString(label: "0 to 7",   got: scoreboard(home: 0,  away: 7),  want: "Away wins 7 to 0")

print("")
print("===== 9. sameFirstAndLast =====")
testBool(label: "a, b, a", got: sameFirstAndLast(list: ["a", "b", "a"]), want: true)
testBool(label: "a, b, c", got: sameFirstAndLast(list: ["a", "b", "c"]), want: false)
testBool(label: "one item", got: sameFirstAndLast(list: ["solo"]),       want: true)
testBool(label: "x, x",    got: sameFirstAndLast(list: ["x", "x"]),      want: true)

print("")
print("===== 10. dropFirst =====")
testArray(label: "3 items", got: dropFirst(list: ["a", "b", "c"]), want: ["b", "c"])
testArray(label: "2 items", got: dropFirst(list: ["x", "y"]),      want: ["y"])
testArray(label: "1 item",  got: dropFirst(list: ["only"]),        want: [])


// ==========================================================
// STUCK?
//
//   averageOf gives 1.0 when it should give 1.3333
//     You divided an Int by an Int. Convert first with Double( ).
//
//   batteryStatus says Good for 100
//     Your conditions are in the wrong order. Go biggest first.
//
//   roundToNearestTen gives back the same number
//     Use % to find how far past a ten it is, then take that
//     much off. If it was 5 or more, add ten back on.
//
//   canAfford is wrong on every coupon test
//     20 percent off means you still pay 80 percent. Multiply
//     the price by 0.8.
//
//   scoreboard has the scores backwards
//     The winner's score goes first, so the away case is not a
//     copy of the home case.
//
//   sameFirstAndLast crashes
//     The last index is count - 1, not count.
//
//   dropFirst will not build
//     You cannot change list directly. Make a var copy first.
// ==========================================================
