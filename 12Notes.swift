//Using Functions Calls

// =========================================================
// EXAMPLE 1:  work out a number, then use it
//
// Carpeting a room. The area is its own idea, so it gets
// its own function. The cost uses it.
// =========================================================

func areaOfRoom(width: Double, length: Double) -> Double {
    return width * length
}

func costToCarpet(width: Double, length: Double, pricePerSqFt: Double) -> Double {

    // Step 1: ask the other function for the area.
    let area = areaOfRoom(width: width, length: length)

    // Step 2: now it is just a number. Use it.
    return area * pricePerSqFt
}

print("")
print("Carpet:")
print(areaOfRoom(width: 12.0, length: 10.0))                            // 120.0
print(costToCarpet(width: 12.0, length: 10.0, pricePerSqFt: 2.50))      // 300.0
print(costToCarpet(width: 9.0, length: 9.0, pricePerSqFt: 4.00))        // 324.0

// You do not have to use a let. This does the same thing:
//
//     return areaOfRoom(width: width, length: length) * pricePerSqFt
//
// The let version is easier to read, and easier to fix when
// something goes wrong, because you can print area and see it.


// =========================================================
// EXAMPLE 2:  work out a number, then dress it up
//
// How much battery time is left. One function does the
// math. The other turns that number into words.
// =========================================================

func batteryMinutes(percent: Int, minutesPerPercent: Int) -> Int {
    return percent * minutesPerPercent
}

func batteryLabel(percent: Int, minutesPerPercent: Int) -> String {

    // Step 1: get the total minutes from the other function.
    let total = batteryMinutes(percent: percent, minutesPerPercent: minutesPerPercent)

    // Step 2: split it into hours and minutes.
    let hours = total / 60
    let mins = total % 60

    // Step 3: a minute under 10 needs a zero in front.
    if mins < 10 {
        return "\(hours):0\(mins) left"
    } else {
        return "\(hours):\(mins) left"
    }
}

print("")
print("Battery:")
print(batteryMinutes(percent: 45, minutesPerPercent: 3))    // 135
print(batteryLabel(percent: 45, minutesPerPercent: 3))      // 2:15 left
print(batteryLabel(percent: 20, minutesPerPercent: 3))      // 1:00 left
print(batteryLabel(percent: 3, minutesPerPercent: 2))       // 0:06 left

// Notice batteryLabel never multiplies anything. It does not
// need to. batteryMinutes already knows how.


// =========================================================
// EXAMPLE 3:  use the answer to work out something else
//
// Loading students onto buses. How many buses, and then how
// many seats end up empty.
// =========================================================

func busesNeeded(students: Int, seatsPerBus: Int) -> Int {
    if students % seatsPerBus == 0 {
        return students / seatsPerBus           // they fill the buses exactly
    } else {
        return students / seatsPerBus + 1       // leftovers need one more bus
    }
}

func emptySeats(students: Int, seatsPerBus: Int) -> Int {

    // Step 1: how many buses are we taking?
    let buses = busesNeeded(students: students, seatsPerBus: seatsPerBus)

    // Step 2: how many seats is that altogether?
    let seats = buses * seatsPerBus

    // Step 3: the ones nobody is sitting in.
    return seats - students
}

print("")
print("Buses:")
print(busesNeeded(students: 50, seatsPerBus: 20))   // 3
print(emptySeats(students: 50, seatsPerBus: 20))    // 10
print(busesNeeded(students: 40, seatsPerBus: 20))   // 2
print(emptySeats(students: 40, seatsPerBus: 20))    // 0
print(busesNeeded(students: 5, seatsPerBus: 20))    // 1
print(emptySeats(students: 5, seatsPerBus: 20))     // 15

