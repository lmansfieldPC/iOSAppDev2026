// ===== Lab 5: Conditionals =====
// Type your answers under each problem.
// Run your code after every problem. Do not wait until the end.
//
// NEW THIS TIME: there are TESTS at the bottom of this file.
// Run the file right now. Every test will say FAIL.
// As you finish each problem, its tests turn to PASS.
// Your goal is all PASS.


// Write your own ///////////////////////////////////
// Each function below is a STUB. It returns a fake answer so
// the file will run. Replace the fake answer with real code.

// Problem 1
// isOdd should return true when n is odd and false when it is even.
func isOdd(n: Int) -> Bool {
    if n % 2 == 1  {
        return true
    } else {
        return false
    }
}

// Problem 2
// bigger should return whichever number is larger.
// If they are equal, return either one.
func bigger(a: Int, b: Int) -> Int {
    return 0            // TODO: replace this
}

// Problem 3
// letterGrade should return "A" for 90 and up, "B" for 80 and up,
// "C" for 70 and up, "D" for 60 and up, and "F" below that.
// Hint: you will need "else if" statements
func letterGrade(score: Int) -> String {
    if score >= 90 {
        return "A"
    } else if score >= 80 {
        return "B"
    } else if score >= 70 {
        return "C"
    } else if score >= 60 {
        return "D"
    } else {
        return "F"
    }
}

// Problem 4
// ticketPrice should return 8 for anyone under 13,
// 9 for anyone 65 or older, and 12 for everyone else.
func ticketPrice(age: Int) -> Int {
    return 0            // TODO: replace this
}

// Problem 5
// absoluteValue should return n when n is positive or zero,
// and return the positive version of n when n is negative.
func absoluteValue(n: Int) -> Int {
    return 0            // TODO: replace this
}

// Problem 6
// canRideCoaster should return true only when the person is
// at least 10 years old AND at least 52 inches tall.
func canRideCoaster(age: Int, height: Int) -> Bool {
    return false        // TODO: replace this
}

// Problem 7
// listSize should return "empty" when the array has 0 items,
// "small" when it has 1 or 2 items, and "big" for 3 or more.
func listSize(list: [String]) -> String {
    return ""           // TODO: replace this
}


// Problem 8: Rock, Paper, Scissors ////////////////////////
// playRound takes the player's move and the computer's move
// and returns "win", "lose", or "tie" from the PLAYER's side.
// Rock beats scissors. Scissors beats paper. Paper beats rock.
// Hint: check for a tie first. Then use || to list the three
// ways the player can win.

func playRound(player: String, computer: String) -> String {
    return ""           // TODO: replace this
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

print("")
print("===== PROBLEM 1: isOdd =====")
testBool(label: "isOdd(7)",  got: isOdd(n: 7),  want: true)
testBool(label: "isOdd(10)", got: isOdd(n: 10), want: false)
testBool(label: "isOdd(0)",  got: isOdd(n: 0),  want: false)

print("")
print("===== PROBLEM 2: bigger =====")
testInt(label: "bigger(3, 9)",  got: bigger(a: 3, b: 9),  want: 9)
testInt(label: "bigger(9, 3)",  got: bigger(a: 9, b: 3),  want: 9)
testInt(label: "bigger(5, 5)",  got: bigger(a: 5, b: 5),  want: 5)

print("")
print("===== PROBLEM 3: letterGrade =====")
testString(label: "letterGrade(95)", got: letterGrade(score: 95), want: "A")
testString(label: "letterGrade(90)", got: letterGrade(score: 90), want: "A")
testString(label: "letterGrade(83)", got: letterGrade(score: 83), want: "B")
testString(label: "letterGrade(70)", got: letterGrade(score: 70), want: "C")
testString(label: "letterGrade(61)", got: letterGrade(score: 61), want: "D")
testString(label: "letterGrade(12)", got: letterGrade(score: 12), want: "F")

print("")
print("===== PROBLEM 4: ticketPrice =====")
testInt(label: "ticketPrice(8)",  got: ticketPrice(age: 8),  want: 8)
testInt(label: "ticketPrice(12)", got: ticketPrice(age: 12), want: 8)
testInt(label: "ticketPrice(13)", got: ticketPrice(age: 13), want: 12)
testInt(label: "ticketPrice(40)", got: ticketPrice(age: 40), want: 12)
testInt(label: "ticketPrice(65)", got: ticketPrice(age: 65), want: 9)
testInt(label: "ticketPrice(80)", got: ticketPrice(age: 80), want: 9)

print("")
print("===== PROBLEM 5: absoluteValue =====")
testInt(label: "absoluteValue(6)",   got: absoluteValue(n: 6),   want: 6)
testInt(label: "absoluteValue(-6)",  got: absoluteValue(n: -6),  want: 6)
testInt(label: "absoluteValue(0)",   got: absoluteValue(n: 0),   want: 0)

print("")
print("===== PROBLEM 6: canRideCoaster =====")
testBool(label: "canRideCoaster(12, 60)", got: canRideCoaster(age: 12, height: 60), want: true)
testBool(label: "canRideCoaster(9, 60)",  got: canRideCoaster(age: 9,  height: 60), want: false)
testBool(label: "canRideCoaster(12, 50)", got: canRideCoaster(age: 12, height: 50), want: false)
testBool(label: "canRideCoaster(10, 52)", got: canRideCoaster(age: 10, height: 52), want: true)

print("")
print("===== PROBLEM 7: listSize =====")
testString(label: "listSize([])",              got: listSize(list: []),                       want: "empty")
testString(label: "listSize([a])",             got: listSize(list: ["a"]),                    want: "small")
testString(label: "listSize([a, b])",          got: listSize(list: ["a", "b"]),               want: "small")
testString(label: "listSize([a, b, c])",       got: listSize(list: ["a", "b", "c"]),          want: "big")
testString(label: "listSize([a, b, c, d])",    got: listSize(list: ["a", "b", "c", "d"]),     want: "big")

print("")
print("===== PROBLEM 8: playRound =====")
testString(label: "rock vs rock",         got: playRound(player: "rock",     computer: "rock"),     want: "tie")
testString(label: "rock vs scissors",     got: playRound(player: "rock",     computer: "scissors"), want: "win")
testString(label: "rock vs paper",        got: playRound(player: "rock",     computer: "paper"),    want: "lose")
testString(label: "paper vs rock",        got: playRound(player: "paper",    computer: "rock"),     want: "win")
testString(label: "paper vs scissors",    got: playRound(player: "paper",    computer: "scissors"), want: "lose")
testString(label: "scissors vs paper",    got: playRound(player: "scissors", computer: "paper"),    want: "win")
testString(label: "scissors vs rock",     got: playRound(player: "scissors", computer: "rock"),     want: "lose")
testString(label: "scissors vs scissors", got: playRound(player: "scissors", computer: "scissors"), want: "tie")

