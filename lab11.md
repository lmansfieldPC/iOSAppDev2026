// ===== Lab 12: Mad Libs Machine =====
//
// Run this in Swift Playground or Xcode. NOT SwiftFiddle.
//
// You are building a form that collects silly answers and then
// builds a story out of them. As the user changes an input, the
// story changes with it.
//
// Work in order. Run after every single change.


import SwiftUI


// ==========================================================
// START CODE - this already works. Build on top of it.
// ==========================================================

struct ContentView: View {

    @State private var name = ""
    @State private var animal = ""
    @State private var count = 1
    @State private var storyColor = Color.blue

    var body: some View {
        Form {

            Section("Fill these in") {
                TextField("Your name", text: $name)
                TextField("An animal", text: $animal)
                Stepper("How many: \(count)", value: $count, in: 1...50)
                ColorPicker("Story color", selection: $storyColor)
            }

            Section("Your story") {
                Text("\(name) woke up and found \(count) \(animal)s in the kitchen.")
                    .font(.title3)
                    .foregroundStyle(storyColor)
            }

        }
    }
}


// ==========================================================
// Part 1: Predict, then run
// Write your prediction as a comment. Then try it and check.
// ==========================================================

// 1. Before you type anything into the name field, what does the
//    story sentence say where your name should be?
//    my prediction:

// 2. Change .font(.title3) to .font(.largeTitle). What moves?
//    my prediction:

// 3. Put .foregroundStyle(storyColor) on the Section instead of on
//    the Text. What gets colored?
//    my prediction:

// 4. Change Stepper's range from 1...50 to 1...3. What happens when
//    you tap plus four times?
//    my prediction:

// 5. Add this line inside the first Section. Run it. What kind of
//    control do you get, and where does it send you when you tap it?
//
//       Picker("Mood", selection: $count) {
//           Text("Happy").tag(1)
//           Text("Grumpy").tag(2)
//       }
//
//    my prediction:


// ==========================================================
// Part 2: Fix the broken code
// Each one has a single mistake. They are commented out so the
// file runs. Uncomment ONE, fix it, run, then move on.
// Write a comment saying what was wrong.
// ==========================================================

// Problem 1
// TextField("Your name", text: name)

// Problem 2
// @State private var age: Int

// Problem 3
// @State private var loudness = 0
// Slider(value: $loudness, in: 0...10)

// Problem 4
// Form {
//     for n in 1...10 {
//         Text("\(n)")
//     }
// }

// Problem 5
// This one RUNS but the output is ugly and wrong.
// You want just the month and day. You get a timestamp.
// @State private var birthday = Date()
// Text("Born on \(birthday).")


// ==========================================================
// Part 3: Build your own
// Keep the Mad Libs idea, but the story is yours. Write a new
// one. It must be at least two sentences long.
//
// Your form must include ALL of these:
//
//   [ ] 4 or more TextFields
//   [ ] 2 different kinds of NUMBER input, chosen from
//          Stepper, Slider, wheel Picker, TextField with .number
//   [ ] 2 different kinds of COLOR input, chosen from
//          ColorPicker, a Picker of color names, a brightness Slider
//   [ ] 1 Toggle
//   [ ] 1 DatePicker, shown in the story as just a month and day
//   [ ] 2 or more Sections with titles
//   [ ] every answer the user types shows up somewhere in the story
//
// Scroll to the REFERENCE at the bottom for how each one is written.
// ==========================================================


// ==========================================================
// Part 4: The Ending
//
// Add a SECOND Text under your story that changes based on what
// the user picked. Use if / else if / else from Lesson 5.
//
// Examples of a rule you could write:
//   - if their number is over 20, the ending is a disaster
//   - if the Toggle is on, the ending is happy
//   - if their name is empty, say "Type your name first!"
//
// Write at least THREE different endings.
// ==========================================================


// ==========================================================
// Challenge
//
// Make a [String] array of five possible endings at the top of
// the file. Add a "Surprise me" section that shows one of them.
//
//   let endings = ["...", "...", "...", "...", "..."]
//
// Pick one with endings.randomElement()! or pull one out by index
// using a number the user chose. Both work. Index is easier.
// ==========================================================


// ==========================================================
// REFERENCE: every form input you can use
//
// This is a real working view. Change ContentView to show it:
// swap the body of ContentView for  AllInputs()  for a minute,
// run it, and poke at every control. Then put your own back.
// ==========================================================

struct AllInputs: View {

    // Each control needs its own @State, and the TYPE must match.
    @State private var text = ""
    @State private var secret = ""
    @State private var wholeNumber = 0
    @State private var stepperValue = 10
    @State private var sliderValue = 0.5
    @State private var wheelValue = 16
    @State private var choice = "Red"
    @State private var isOn = false
    @State private var pickedColor = Color.purple
    @State private var day = Date()

    let colorNames = ["Red", "Green", "Blue", "Orange"]

    var body: some View {
        Form {

            Section("Text") {
                // String
                TextField("Type anything", text: $text)

                // String, but hidden as you type
                SecureField("A secret word", text: $secret)
            }

            Section("Numbers") {
                // Int, typed in directly
                TextField("Type a number", value: $wholeNumber, format: .number)

                // Int, plus and minus buttons
                Stepper("Stepper: \(stepperValue)", value: $stepperValue, in: 0...100)

                // Double ONLY. Never Int.
                Slider(value: $sliderValue, in: 0...1)
                Text("Slider is at \(sliderValue)")

                // Int, spinning wheel
                Picker("Wheel", selection: $wheelValue) {
                    ForEach(1...120, id: \.self) { number in
                        Text("\(number)")
                    }
                }
                .pickerStyle(.wheel)
                .frame(height: 120)
            }

            Section("Choices") {
                // String, side by side buttons
                Picker("Segmented", selection: $choice) {
                    ForEach(colorNames, id: \.self) { name in
                        Text(name)
                    }
                }
                .pickerStyle(.segmented)

                // String, drop down menu
                Picker("Menu", selection: $choice) {
                    ForEach(colorNames, id: \.self) { name in
                        Text(name)
                    }
                }
                .pickerStyle(.menu)

                // Bool, on and off switch
                Toggle("Toggle me", isOn: $isOn)
            }

            Section("Color") {
                // Color, the full rainbow picker
                ColorPicker("Pick any color", selection: $pickedColor)

                // Color, chosen by NAME using the function below
                Text("The segmented picker says \(choice)")
                    .foregroundStyle(colorFor(name: choice))

                // Color, darkened by a slider
                pickedColor
                    .brightness(-sliderValue)
                    .frame(height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            Section("Date") {
                // Date, calendar only, no clock
                DatePicker("Pick a day", selection: $day, displayedComponents: .date)

                // Showing just the parts you want
                Text("Just the number: \(day, format: .dateTime.day())")
                Text("Month and day: \(day, format: .dateTime.month(.wide).day())")
                Text("Weekday: \(day, format: .dateTime.weekday(.wide))")
            }

        }
    }
}


// A color picker made out of Lesson 5. Turns a name into a Color.
func colorFor(name: String) -> Color {
    if name == "Red" {
        return .red
    } else if name == "Green" {
        return .green
    } else if name == "Blue" {
        return .blue
    } else {
        return .orange
    }
}


// ==========================================================
// Before you turn it in
//
//   [ ] Every control has its own @State with a starting value
//   [ ] Every @State type matches its control
//          TextField -> String      Slider -> Double
//          Stepper   -> Int         Toggle -> Bool
//          ColorPicker -> Color     DatePicker -> Date
//   [ ] Every $ is where it belongs
//   [ ] Your story reads as a real sentence, not a list
//   [ ] The date shows as a day, not a timestamp
//   [ ] You can change every single control and nothing crashes
// ==========================================================
