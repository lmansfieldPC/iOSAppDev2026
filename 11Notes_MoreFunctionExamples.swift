
// ===== Example A: splitting a number with / and % =====
// Height in inches becomes feet and inches.

func inchesToHeight(inches: Int) -> String {
    let feet = inches / 12          // how many whole feet fit
    let left = inches % 12          // what is left over

    return "\(feet) ft \(left) in"
}

print(inchesToHeight(inches: 67))   // 5 ft 7 in
print(inchesToHeight(inches: 72))   // 6 ft 0 in
print(inchesToHeight(inches: 5))    // 0 ft 5 in


// ===== Example B: padding a number with a zero =====
// Locker numbers are always three digits.

func lockerTag(n: Int) -> String {
    if n < 10 {
        return "Locker 00\(n)"      // one digit, needs two zeros
    } else if n < 100 {
        return "Locker 0\(n)"       // two digits, needs one zero
    } else {
        return "Locker \(n)"        // three digits, needs none
    }
}

print(lockerTag(n: 7))              // Locker 007
print(lockerTag(n: 42))             // Locker 042
print(lockerTag(n: 315))            // Locker 315


// ===== Example C: a Bool that needs math first =====
// Is the order over the spending limit?
// Tax is added only sometimes.

func overTheLimit(subtotal: Double, limit: Double, addTax: Bool) -> Bool {
    var total = subtotal            // start with the plain price

    if addTax {
        total = subtotal * 1.08     // adding 8 percent means paying 108 percent
    }

    return total > limit            // a comparison IS a Bool, so just return it
}

print(overTheLimit(subtotal: 40.0, limit: 50.0, addTax: false))   // false
print(overTheLimit(subtotal: 40.0, limit: 50.0, addTax: true))    // false, 43.20
print(overTheLimit(subtotal: 48.0, limit: 50.0, addTax: true))    // true,  51.84
