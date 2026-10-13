# Lab 12: Mad Libs Machine

You are building a form that collects silly answers and then builds a story out of them. As the user changes an input, the story changes with it.

The walkthrough builds the machine one piece at a time. Do each step, run it, and read the short explanation before moving on. Then you make your own.

---

## Step 1: One question

Start a new project and replace `ContentView` with this.

```swift
import SwiftUI

struct ContentView: View {

    @State private var name = ""

    var body: some View {
        Form {
            TextField("Your name", text: $name)
            Text("Hello, \(name)!")
        }
    }
}
```

Run it and type your name. The greeting changes as you type.

**What `@State` means.** A normal `let` or `var` inside a view cannot change once the screen is drawn. `@State` marks a value as one that *will* change, and tells SwiftUI to redraw the screen every time it does. Without it, typing would go nowhere.

**Why it needs a starting value.** `@State private var name = ""` starts as an empty string. If you write `@State private var name: String` with no value, Swift has nothing to show before the user types, and the project will not build. Every `@State` needs a starting value.

**What the `$` does.** There are two different jobs here, and they use different syntax:

- `Text("Hello, \(name)!")` — just *reading* the value. No dollar sign.
- `TextField("Your name", text: $name)` — reading **and writing**. The TextField has to be able to change `name` when the user types, so it needs `$name`.

The `$` means "a two-way connection to this value." Any control the user can change needs it. Anything that only displays needs the plain name.

> **Try it:** delete the `$` from `$name` and run. Read the error. Put it back.

---

## Step 2: More questions, one story

```swift
@State private var name = ""
@State private var animal = ""
```

```swift
var body: some View {
    Form {
        TextField("Your name", text: $name)
        TextField("An animal", text: $animal)

        Text("\(name) woke up and found a \(animal) in the kitchen.")
    }
}
```

Each control gets its own `@State`. Four questions means four `@State` lines.

The story line is just string interpolation from Lesson 1 — the same `\( )` you used in `print`. Nothing new.

> **Try it:** add a third `TextField` for a place, and work it into the sentence.

---

## Step 3: Numbers

A `TextField` hands you a `String`. You cannot do math with it, and a number keypad will not appear. For numbers, use a control built for numbers.

```swift
@State private var count = 1
```

```swift
Stepper("How many: \(count)", value: $count, in: 1...50)
```

`Stepper` gives plus and minus buttons. `in: 1...50` sets the lowest and highest it will go — tap past either end and nothing happens.

**The type has to match the control.** This is the error you will hit most in this lab:

| Control | What type its `@State` must be |
|---|---|
| `TextField` | `String` |
| `Stepper` | `Int` |
| `Slider` | `Double` |
| `Toggle` | `Bool` |
| `ColorPicker` | `Color` |
| `DatePicker` | `Date` |

`Slider` is the one that catches people. It needs a `Double`, so its starting value must be written `0.0`, not `0`. Plain `0` is an `Int` and the project will not build.

> **Try it:** add `@State private var loudness = 0.0` and `Slider(value: $loudness, in: 0...10)`. Then change `0.0` to `0` and read the error so you recognize it later.

---

## Step 4: Color

```swift
@State private var storyColor = Color.blue
```

```swift
ColorPicker("Story color", selection: $storyColor)

Text("\(name) woke up and found a \(animal) in the kitchen.")
    .foregroundStyle(storyColor)
```

Notice the two different forms again: `$storyColor` where the user picks it, plain `storyColor` where you use it.

**Where you attach a modifier matters.** `.foregroundStyle(storyColor)` on the `Text` colors that one line. Put the same modifier on the whole `Form` and it colors everything in it. Same modifier, different result, because it applies to whatever it is attached to.

> **Try it:** move `.foregroundStyle(storyColor)` onto the `Form` and run it. Then put it back on the `Text`.

---

## Step 5: Sections

Once you have six or seven controls, the form turns into a wall. `Section` groups them under a heading.

```swift
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
```

That is the whole machine. Everything after this is making it yours.

---

## Step 6: Dates

```swift
@State private var birthday = Date()
```

```swift
DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
```

`displayedComponents: .date` hides the clock half. Leave it off and students get hours and minutes too.

A `Date` holds far more than you want to show. Printed raw, you get a timestamp with the time and timezone attached. Say which pieces you want:

```swift
Text("Born on \(birthday, format: .dateTime.month(.wide).day()).")
```

The pieces chain in any order:

```swift
.day()                 // 13
.month(.wide)          // October
.month(.abbreviated)   // Oct
.weekday(.wide)        // Tuesday
.year()                // 2026
```

> **Try it:** show the birthday with no format first so you see the timestamp, then add the format.

---

## Now build your own

Keep the Mad Libs idea, but the story is yours. Write a new one, at least two sentences long.

Your form must include **all** of these:

- [ ] 4 or more `TextField`s
- [ ] 2 different kinds of **number** input, from `Stepper`, `Slider`, wheel `Picker`, `TextField` with `.number`
- [ ] 2 different kinds of **color** input, from `ColorPicker`, a `Picker` of color names, a brightness `Slider`
- [ ] 1 `Toggle`
- [ ] 1 `DatePicker`, shown in the story as just a month and day
- [ ] 2 or more `Section`s with titles
- [ ] every answer the user gives shows up somewhere in the story

The reference at the bottom has every control written out.

---

## The ending

Add a second `Text` under your story that changes based on what the user picked. Use `if` / `else if` / `else` from Lesson 5.

Rules you could write:

- if their number is over 20, the ending is a disaster
- if the Toggle is on, the ending is happy
- if their name is empty, say "Type your name first!"

Write at least **three** different endings.

---

## Challenge

Make a `[String]` array of five possible endings at the top of the file. Add a "Surprise me" section that shows one of them.

```swift
let endings = ["...", "...", "...", "...", "..."]
```

Pick one with `endings.randomElement()!`, or pull one out by index using a number the user chose. Both work. Index is easier.

---

## Reference: every form input

A real working view. To try it, change `ContentView`'s body to show `AllInputs()` for a minute, poke at every control, then put yours back.

```swift
struct AllInputs: View {

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

                Text("Just the number: \(day, format: .dateTime.day())")
                Text("Month and day: \(day, format: .dateTime.month(.wide).day())")
                Text("Weekday: \(day, format: .dateTime.weekday(.wide))")
            }

        }
    }
}
```

A color picker built out of Lesson 4 and Lesson 5. It turns a name into a `Color`.

```swift
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
```

---

## Before you turn it in

- [ ] Every control has its own `@State` with a starting value
- [ ] Every `@State` type matches its control
- [ ] Every `$` is where it belongs, and nowhere it isn't
- [ ] Your story reads as a real sentence, not a list
- [ ] The date shows as a day, not a timestamp
- [ ] You can change every single control and nothing crashes
