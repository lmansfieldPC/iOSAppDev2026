# Lab 9: Mad Libs Machine

Pick up the project you built in Lab 8. If you do not have it, start from the code at the bottom of Lab 8.

Now you make it yours.

---

## Build your own

Write a **new** story, at least two sentences long. Not the kitchen one.

Your form must include **all** of these:

- [ ] 4 or more `TextField`s
- [ ] 2 different kinds of **number** input, from `Stepper`, `Slider`, wheel `Picker`, `TextField` with `.number`
- [ ] 2 different kinds of **color** input, from `ColorPicker`, a `Picker` of color names, a brightness `Slider`
- [ ] 1 `Toggle`
- [ ] 1 `DatePicker`, shown in the story as just a month and day
- [ ] 2 or more `Section`s with titles
- [ ] every answer the user gives shows up somewhere in the story

The reference at the bottom has every control written out. You have only used four of them so far.

---

## The ending

Add a second `Text` under your story that changes based on what the user picked. Use `if` / `else if` / `else` from Lesson 5.

Rules you could write:

- if their number is over 20, the ending is a disaster
- if the `Toggle` is on, the ending is happy
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

    @State var text = ""
    @State var secret = ""
    @State var wholeNumber = 0
    @State var stepperValue = 10
    @State var sliderValue = 0.5
    @State var wheelValue = 16
    @State var choice = "Red"
    @State var isOn = false
    @State var pickedColor = Color.purple
    @State var day = Date()

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

## Matching types

| Control | `@State` type |
|---|---|
| `TextField` | `String` |
| `SecureField` | `String` |
| `Slider` | `Double` |
| `Stepper` | `Int` |
| `Toggle` | `Bool` |
| `ColorPicker` | `Color` |
| `DatePicker` | `Date` |
| `Picker` | whatever the tags are |

---

## Before you turn it in

- [ ] Every control has its own `@State` with a starting value
- [ ] Every `@State` type matches its control
- [ ] Every `$` is where it belongs, and nowhere it isn't
- [ ] Your story reads as a real sentence, not a list
- [ ] The date shows as a day, not a timestamp
- [ ] At least three endings, and you can make each one appear
- [ ] You can change every single control and nothing crashes
