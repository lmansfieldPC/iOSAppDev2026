// =========================================================
// Lab 10: Five Apps
//
// This is one app with five mini apps inside it.
// Use the buttons across the top to switch between them.
//
// Every screen is already built. Every control already works.
// But every answer it gives you is zero, because the ten
// functions that do the thinking are empty.
//
// YOUR JOB: write the ten functions.
//
// This file is organized app by app. Each app has:
//
//     1. the functions YOU WRITE
//     2. the screen that calls them, already done
//
// Only ever change the parts marked YOU WRITE THIS.
// The tests all live at the very bottom. You never need
// to touch them, or even read them.
//
// Run it in Swift Playground. NOT SwiftFiddle.
//
// Two ways to check your work:
//   1. Switch to that app and look at the numbers.
//   2. Look at the console. Tests run every time you launch.
// =========================================================

import SwiftUI


// #########################################################
// #                                                       #
// #   APP 1 of 5:  TIP SPLITTER                           #
// #                                                       #
// #   Split a bill, with tip, between some people.        #
// #                                                       #
// #########################################################


// ---------------------------------------------------------
// YOU WRITE THIS  --  1a. totalWithTip
//
// The bill plus the tip.
// The tip percent comes in as a whole number.
//
//   50.0,  20  ->  60.0
//   100.0, 15  ->  115.0
//   24.0,  0   ->  24.0
// ---------------------------------------------------------

func totalWithTip(bill: Double, tipPercent: Int) -> Double {
    return 0.0          // TODO: replace this
}


// ---------------------------------------------------------
// YOU WRITE THIS  --  1b. perPerson
//
// What each person owes once the bill is split.
//
// You already wrote totalWithTip. Use it here instead of
// doing the tip math a second time.
//
//   50.0,  20, 2  ->  30.0
//   100.0, 15, 4  ->  28.75
//   24.0,  0,  3  ->  8.0
// ---------------------------------------------------------

func perPerson(bill: Double, tipPercent: Int, people: Int) -> Double {
    return 0.0          // TODO: replace this
}


// ------------ the screen -- already done ------------------

struct TipView: View {
    @State var bill = 50.0
    @State var tipPercent = 20
    @State var people = 2

    var body: some View {
        Form {
            Section("The bill") {
                TextField("Bill amount", value: $bill, format: .number)
                Stepper("Tip: \(tipPercent)%", value: $tipPercent, in: 0...40, step: 5)
                Stepper("Splitting \(people) ways", value: $people, in: 1...20)
            }

            Section("With tip") {
                Text(totalWithTip(bill: bill, tipPercent: tipPercent),
                     format: .currency(code: "USD"))
                    .font(.title2)
            }

            Section("Each person pays") {
                Text(perPerson(bill: bill, tipPercent: tipPercent, people: people),
                     format: .currency(code: "USD"))
                    .font(.largeTitle)
                    .foregroundStyle(.green)
            }
        }
    }
}




// #########################################################
// #                                                       #
// #   APP 2 of 5:  RUN PACE                               #
// #                                                       #
// #   Turn a run into a pace per mile.                    #
// #                                                       #
// #########################################################


// ---------------------------------------------------------
// YOU WRITE THIS  --  2a. secondsPerMile
//
// How many seconds it took to run one mile.
//
// Minutes come in, seconds go out, so convert first.
//
//   25 minutes, 3 miles  ->  500
//   30 minutes, 4 miles  ->  450
//   20 minutes, 2 miles  ->  600
// ---------------------------------------------------------

func secondsPerMile(minutes: Int, miles: Int) -> Int {
    return 0            // TODO: replace this
}


// ---------------------------------------------------------
// YOU WRITE THIS  --  2b. pacePerMile
//
// That same pace, written the way a runner says it.
//
// Use secondsPerMile, then split it into minutes and
// seconds. Seconds under 10 need a zero in front, or
// 5 minutes 7 seconds comes out as 5:7.
//
//   25 minutes, 3 miles  ->  "8:20"
//   20 minutes, 2 miles  ->  "10:00"
//   41 minutes, 8 miles  ->  "5:07"
// ---------------------------------------------------------

func pacePerMile(minutes: Int, miles: Int) -> String {
    return ""           // TODO: replace this
}


// ------------ the screen -- already done ------------------

struct PaceView: View {
    @State var minutes = 25
    @State var miles = 3

    var body: some View {
        Form {
            Section("Your run") {
                Stepper("\(minutes) minutes", value: $minutes, in: 1...300)
                Stepper("\(miles) miles", value: $miles, in: 1...50)
            }

            Section("Seconds per mile") {
                Text("\(secondsPerMile(minutes: minutes, miles: miles))")
                    .font(.title2)
            }

            Section("Your pace") {
                Text(pacePerMile(minutes: minutes, miles: miles))
                    .font(.system(size: 56))
                    .foregroundStyle(.blue)
                Text("per mile")
                    .foregroundStyle(.secondary)
            }
        }
    }
}




// #########################################################
// #                                                       #
// #   APP 3 of 5:  QUIZ SCORE                             #
// #                                                       #
// #   Turn right answers into a percent and a message.    #
// #                                                       #
// #########################################################


// ---------------------------------------------------------
// YOU WRITE THIS  --  3a. percentScore
//
// What percent of the questions were right.
//
// Careful: both numbers coming in are Int, and Int divided
// by Int throws the decimals away. 7 / 8 would come out as
// 0 instead of 0.875.
//
//   8 of 10  ->  80.0
//   7 of 8   ->  87.5
//   5 of 5   ->  100.0
//   0 of 5   ->  0.0
// ---------------------------------------------------------

func percentScore(correct: Int, total: Int) -> Double {
    return 0.0          // TODO: replace this
}


// ---------------------------------------------------------
// YOU WRITE THIS  --  3b. feedbackFor
//
// Turn a percent into something to say.
//
//   90 and up  ->  "Nailed it"
//   70 to 89   ->  "Nice work"
//   50 to 69   ->  "Almost there"
//   under 50   ->  "Try again"
// ---------------------------------------------------------

func feedbackFor(percent: Double) -> String {
    return ""           // TODO: replace this
}


// ------------ the screen -- already done ------------------

struct QuizView: View {
    @State var correct = 8
    @State var total = 10

    var body: some View {
        Form {
            Section("The quiz") {
                Stepper("Got \(correct) right", value: $correct, in: 0...50)
                Stepper("Out of \(total)", value: $total, in: 1...50)
            }

            Section("Score") {
                Text("\(percentScore(correct: correct, total: total), specifier: "%.1f")%")
                    .font(.system(size: 56))

                Text(feedbackFor(percent: percentScore(correct: correct, total: total)))
                    .font(.title2)
                    .foregroundStyle(.purple)
            }
        }
    }
}




// #########################################################
// #                                                       #
// #   APP 4 of 5:  ROAD TRIP                              #
// #                                                       #
// #   Work out gas money, and whether you have to stop.   #
// #                                                       #
// #########################################################


// ---------------------------------------------------------
// YOU WRITE THIS  --  4a. tripCost
//
// What the gas for a trip will cost.
//
// Work out how many gallons the trip needs, then what
// those gallons cost.
//
//   300 miles, 30 mpg, $3.50  ->  35.0
//   120 miles, 24 mpg, $4.00  ->  20.0
//   450 miles, 25 mpg, $3.20  ->  57.6
// ---------------------------------------------------------

func tripCost(miles: Double, mpg: Double, pricePerGallon: Double) -> Double {
    return 0.0          // TODO: replace this
}


// ---------------------------------------------------------
// YOU WRITE THIS  --  4b. canMakeIt
//
// True if the trip fits in one tank of gas.
//
// A full tank goes mpg times tankGallons miles.
// Remember you do not need if / else to return a Bool.
//
//   300 miles, 30 mpg, 12 gallon tank  ->  true
//   400 miles, 30 mpg, 12 gallon tank  ->  false
//   360 miles, 30 mpg, 12 gallon tank  ->  true
// ---------------------------------------------------------

func canMakeIt(miles: Double, mpg: Double, tankGallons: Double) -> Bool {
    return false        // TODO: replace this
}


// ------------ the screen -- already done ------------------

struct RoadTripView: View {
    @State var miles = 300.0
    @State var mpg = 30.0
    @State var price = 3.50
    @State var tank = 12.0

    var body: some View {
        Form {
            Section("The trip") {
                TextField("Miles", value: $miles, format: .number)
                TextField("Miles per gallon", value: $mpg, format: .number)
                TextField("Price per gallon", value: $price, format: .number)
                TextField("Tank size in gallons", value: $tank, format: .number)
            }

            Section("Gas will cost") {
                Text(tripCost(miles: miles, mpg: mpg, pricePerGallon: price),
                     format: .currency(code: "USD"))
                    .font(.largeTitle)
            }

            Section("On one tank?") {
                if canMakeIt(miles: miles, mpg: mpg, tankGallons: tank) {
                    Text("You can make it")
                        .font(.title2)
                        .foregroundStyle(.green)
                } else {
                    Text("You will need to stop for gas")
                        .font(.title2)
                        .foregroundStyle(.red)
                }
            }
        }
    }
}




// #########################################################
// #                                                       #
// #   APP 5 of 5:  PIZZA PARTY                            #
// #                                                       #
// #   Work out how many pizzas to order for a crowd.      #
// #                                                       #
// #########################################################


// ---------------------------------------------------------
// YOU WRITE THIS  --  5a. pizzasNeeded
//
// How many whole pizzas to order.
//
// Work out the total slices everyone wants, then how many
// pizzas that takes. A leftover slice still needs a whole
// pizza to come from.
//
//   10 people, 3 slices each, 8 per pizza  ->  4
//   8 people,  2 slices each, 8 per pizza  ->  2
//   3 people,  2 slices each, 8 per pizza  ->  1
//   0 people,  3 slices each, 8 per pizza  ->  0
// ---------------------------------------------------------

func pizzasNeeded(people: Int, slicesEach: Int, slicesPerPizza: Int) -> Int {
    return 0            // TODO: replace this
}


// ---------------------------------------------------------
// YOU WRITE THIS  --  5b. leftoverSlices
//
// How many slices are left in the boxes after everyone
// takes theirs.
//
// Use pizzasNeeded. All those pizzas have slices, and the
// people take some of them.
//
//   10 people, 3 slices each, 8 per pizza  ->  2
//   8 people,  2 slices each, 8 per pizza  ->  0
//   3 people,  2 slices each, 8 per pizza  ->  2
// ---------------------------------------------------------

func leftoverSlices(people: Int, slicesEach: Int, slicesPerPizza: Int) -> Int {
    return 0            // TODO: replace this
}


// ------------ the screen -- already done ------------------

struct PizzaPartyView: View {
    @State var people = 10
    @State var slicesEach = 3
    @State var slicesPerPizza = 8

    var body: some View {
        Form {
            Section("The party") {
                Stepper("\(people) people", value: $people, in: 0...100)
                Stepper("\(slicesEach) slices each", value: $slicesEach, in: 1...10)
                Stepper("\(slicesPerPizza) slices per pizza", value: $slicesPerPizza, in: 4...16)
            }

            Section("Order this many") {
                Text("\(pizzasNeeded(people: people, slicesEach: slicesEach, slicesPerPizza: slicesPerPizza))")
                    .font(.system(size: 56))
                    .foregroundStyle(.orange)
                Text("pizzas")
                    .foregroundStyle(.secondary)
            }

            Section("Leftovers") {
                Text("\(leftoverSlices(people: people, slicesEach: slicesEach, slicesPerPizza: slicesPerPizza)) slices")
                    .font(.title2)
            }
        }
    }
}




// #########################################################
// #                                                       #
// #   THE SWITCHER                                        #
// #                                                       #
// #   Nothing below here is yours to change.              #
// #                                                       #
// #########################################################


// The switcher that picks which of the five apps you are
// looking at. It is built out of a Picker and an if / else
// chain, which you already know how to write.
//
// To work on ONE screen by itself, replace the whole if /
// else chain with just that screen, like this:
//
//     PaceView()
//
// Put the chain back when you are done.

struct ContentView: View {
    @State var screen = "Tip"

    let screens = ["Tip", "Pace", "Quiz", "Trip", "Pizza"]

    var body: some View {
        VStack(spacing: 0) {

            Picker("Which app", selection: $screen) {
                ForEach(screens, id: \.self) { name in
                    Text(name)
                }
            }
            .pickerStyle(.segmented)
            .padding()

            if screen == "Tip" {
                TipView()
            } else if screen == "Pace" {
                PaceView()
            } else if screen == "Quiz" {
                QuizView()
            } else if screen == "Trip" {
                RoadTripView()
            } else {
                PizzaPartyView()
            }

        }
        .onAppear {
            runTests()
        }
    }
}


// #########################################################
// #                                                       #
// #   THE TESTS                                           #
// #                                                       #
// #   These run every time you launch and print PASS or   #
// #   FAIL to the console. You do not have to read any    #
// #   of this. Just look at what it prints.               #
// #                                                       #
// #########################################################


func testTipSplitter() {
    print("")
    print("===== APP 1: Tip Splitter =====")
    testDouble(label: "1a. 50 at 20%",  got: totalWithTip(bill: 50.0,  tipPercent: 20), want: 60.0)
    testDouble(label: "1a. 100 at 15%", got: totalWithTip(bill: 100.0, tipPercent: 15), want: 115.0)
    testDouble(label: "1a. 24 at 0%",   got: totalWithTip(bill: 24.0,  tipPercent: 0),  want: 24.0)
    testDouble(label: "1a. 80 at 25%",  got: totalWithTip(bill: 80.0,  tipPercent: 25), want: 100.0)

    testDouble(label: "1b. 50, 20%, 2",  got: perPerson(bill: 50.0,  tipPercent: 20, people: 2), want: 30.0)
    testDouble(label: "1b. 100, 15%, 4", got: perPerson(bill: 100.0, tipPercent: 15, people: 4), want: 28.75)
    testDouble(label: "1b. 24, 0%, 3",   got: perPerson(bill: 24.0,  tipPercent: 0,  people: 3), want: 8.0)
    testDouble(label: "1b. 80, 25%, 5",  got: perPerson(bill: 80.0,  tipPercent: 25, people: 5), want: 20.0)
}


func testRunPace() {
    print("")
    print("===== APP 2: Run Pace =====")
    testInt(label: "2a. 25 min, 3 miles", got: secondsPerMile(minutes: 25, miles: 3), want: 500)
    testInt(label: "2a. 30 min, 4 miles", got: secondsPerMile(minutes: 30, miles: 4), want: 450)
    testInt(label: "2a. 20 min, 2 miles", got: secondsPerMile(minutes: 20, miles: 2), want: 600)
    testInt(label: "2a. 10 min, 3 miles", got: secondsPerMile(minutes: 10, miles: 3), want: 200)

    testString(label: "2b. 25 min, 3 miles", got: pacePerMile(minutes: 25, miles: 3), want: "8:20")
    testString(label: "2b. 30 min, 4 miles", got: pacePerMile(minutes: 30, miles: 4), want: "7:30")
    testString(label: "2b. 20 min, 2 miles", got: pacePerMile(minutes: 20, miles: 2), want: "10:00")
    testString(label: "2b. 10 min, 3 miles", got: pacePerMile(minutes: 10, miles: 3), want: "3:20")
    testString(label: "2b. 41 min, 8 miles", got: pacePerMile(minutes: 41, miles: 8), want: "5:07")
}


func testQuizScore() {
    print("")
    print("===== APP 3: Quiz Score =====")
    testDouble(label: "3a. 8 of 10", got: percentScore(correct: 8, total: 10), want: 80.0)
    testDouble(label: "3a. 7 of 8",  got: percentScore(correct: 7, total: 8),  want: 87.5)
    testDouble(label: "3a. 5 of 5",  got: percentScore(correct: 5, total: 5),  want: 100.0)
    testDouble(label: "3a. 0 of 5",  got: percentScore(correct: 0, total: 5),  want: 0.0)
    testDouble(label: "3a. 1 of 3",  got: percentScore(correct: 1, total: 3),  want: 33.3333)

    testString(label: "3b. 100", got: feedbackFor(percent: 100.0), want: "Nailed it")
    testString(label: "3b. 90",  got: feedbackFor(percent: 90.0),  want: "Nailed it")
    testString(label: "3b. 89",  got: feedbackFor(percent: 89.0),  want: "Nice work")
    testString(label: "3b. 70",  got: feedbackFor(percent: 70.0),  want: "Nice work")
    testString(label: "3b. 69",  got: feedbackFor(percent: 69.0),  want: "Almost there")
    testString(label: "3b. 50",  got: feedbackFor(percent: 50.0),  want: "Almost there")
    testString(label: "3b. 49",  got: feedbackFor(percent: 49.0),  want: "Try again")
    testString(label: "3b. 0",   got: feedbackFor(percent: 0.0),   want: "Try again")
}


func testRoadTrip() {
    print("")
    print("===== APP 4: Road Trip =====")
    testDouble(label: "4a. 300 mi, 30 mpg, 3.50", got: tripCost(miles: 300.0, mpg: 30.0, pricePerGallon: 3.50), want: 35.0)
    testDouble(label: "4a. 120 mi, 24 mpg, 4.00", got: tripCost(miles: 120.0, mpg: 24.0, pricePerGallon: 4.00), want: 20.0)
    testDouble(label: "4a. 450 mi, 25 mpg, 3.20", got: tripCost(miles: 450.0, mpg: 25.0, pricePerGallon: 3.20), want: 57.6)
    testDouble(label: "4a. 0 mi",                 got: tripCost(miles: 0.0,   mpg: 25.0, pricePerGallon: 3.00), want: 0.0)

    testBool(label: "4b. 300 mi, 360 range", got: canMakeIt(miles: 300.0, mpg: 30.0, tankGallons: 12.0), want: true)
    testBool(label: "4b. 400 mi, 360 range", got: canMakeIt(miles: 400.0, mpg: 30.0, tankGallons: 12.0), want: false)
    testBool(label: "4b. 360 mi, 360 range", got: canMakeIt(miles: 360.0, mpg: 30.0, tankGallons: 12.0), want: true)
    testBool(label: "4b. 100 mi, 80 range",  got: canMakeIt(miles: 100.0, mpg: 20.0, tankGallons: 4.0),  want: false)
}


func testPizzaParty() {
    print("")
    print("===== APP 5: Pizza Party =====")
    testInt(label: "5a. 10 people, 3 each", got: pizzasNeeded(people: 10, slicesEach: 3, slicesPerPizza: 8), want: 4)
    testInt(label: "5a. 8 people, 2 each",  got: pizzasNeeded(people: 8,  slicesEach: 2, slicesPerPizza: 8), want: 2)
    testInt(label: "5a. 3 people, 2 each",  got: pizzasNeeded(people: 3,  slicesEach: 2, slicesPerPizza: 8), want: 1)
    testInt(label: "5a. 0 people",          got: pizzasNeeded(people: 0,  slicesEach: 3, slicesPerPizza: 8), want: 0)
    testInt(label: "5a. 16 people, 4 each", got: pizzasNeeded(people: 16, slicesEach: 4, slicesPerPizza: 8), want: 8)

    testInt(label: "5b. 10 people, 3 each", got: leftoverSlices(people: 10, slicesEach: 3, slicesPerPizza: 8), want: 2)
    testInt(label: "5b. 8 people, 2 each",  got: leftoverSlices(people: 8,  slicesEach: 2, slicesPerPizza: 8), want: 0)
    testInt(label: "5b. 3 people, 2 each",  got: leftoverSlices(people: 3,  slicesEach: 2, slicesPerPizza: 8), want: 2)
    testInt(label: "5b. 0 people",          got: leftoverSlices(people: 0,  slicesEach: 3, slicesPerPizza: 8), want: 0)
}


// Runs every app's tests, in order, at launch.

func runTests() {
    testTipSplitter()
    testRunPace()
    testQuizScore()
    testRoadTrip()
    testPizzaParty()
    print("")
}


// The four checkers the tests above are built from.

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


