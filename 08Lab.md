# Lab 8: Building a Form


You are building a small machine: the user answers some questions, and a sentence underneath changes as they answer. Next class you will turn it into a full Mad Libs game.

Do each step, run it, and read the explanation before moving on.

---

## Step 1: One question

Start a new project and replace `ContentView` with this.

```swift
import SwiftUI

struct ContentView: View {

    @State var name = ""

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

**Why it needs a starting value.** `@State var name = ""` starts as an empty string. If you write `@State var name: String` with no value, Swift has nothing to show before the user types, and the project will not build. Every `@State` needs a starting value.

**What the `$` does.** There are two different jobs here, and they use different syntax:

- `Text("Hello, \(name)!")` — just *reading* the value. No dollar sign.
- `TextField("Your name", text: $name)` — reading **and writing**. The TextField has to be able to change `name` when the user types, so it needs `$name`.

The `$` means "a two-way connection to this value." Any control the user can change needs it. Anything that only displays needs the plain name.

> **Try it:** delete the `$` from `$name` and run. Read the error. Put it back.

---

## Step 2: More questions, one sentence

```swift
@State var name = ""
@State var animal = ""
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

The sentence is just string interpolation from Lesson 1 — the same `\( )` you used in `print`. Nothing new.

> **Try it:** add a third `TextField` for a place, and work it into the sentence.

---

## Step 3: Numbers

A `TextField` hands you a `String`. You cannot do math with it, and a number keypad will not appear. For numbers, use a control built for numbers.

```swift
@State var count = 1
```

```swift
Stepper("How many: \(count)", value: $count, in: 1...50)
```

`Stepper` gives plus and minus buttons. `in: 1...50` sets the lowest and highest it will go — tap past either end and nothing happens.

**The type has to match the control.** This is the error you will hit most:

| Control | What type its `@State` must be |
|---|---|
| `TextField` | `String` |
| `Stepper` | `Int` |
| `Slider` | `Double` |
| `Toggle` | `Bool` |
| `ColorPicker` | `Color` |
| `DatePicker` | `Date` |

`Slider` is the one that catches people. It needs a `Double`, so its starting value must be written `0.0`, not `0`. Plain `0` is an `Int` and the project will not build.

> **Try it:** add `@State var loudness = 0.0` and `Slider(value: $loudness, in: 0...10)`. Then change `0.0` to `0` and read the error so you recognize it later. Change it back.

---

## Step 4: Color

```swift
@State var storyColor = Color.blue
```

```swift
ColorPicker("Story color", selection: $storyColor)

Text("\(name) woke up and found a \(animal) in the kitchen.")
    .foregroundStyle(storyColor)
```

Notice the two forms again: `$storyColor` where the user picks it, plain `storyColor` where you use it.

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

> **Try it:** move the `Stepper` into the second Section and run it. Notice that it still works — Sections change where things sit, not what they do. Move it back.

---

## Step 6: Dates

```swift
@State var birthday = Date()
```

```swift
DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
```

`displayedComponents: .date` hides the clock half. Leave it off and you get hours and minutes too.

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

## What you should have

By the end of Step 6 your file should look about like this. Save it — you build on it next class.

```swift
import SwiftUI

struct ContentView: View {

    @State var name = ""
    @State var animal = ""
    @State var count = 1
    @State var storyColor = Color.blue
    @State var birthday = Date()

    var body: some View {
        Form {

            Section("Fill these in") {
                TextField("Your name", text: $name)
                TextField("An animal", text: $animal)
                Stepper("How many: \(count)", value: $count, in: 1...50)
                ColorPicker("Story color", selection: $storyColor)
                DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
            }

            Section("Your story") {
                Text("\(name) woke up and found \(count) \(animal)s in the kitchen.")
                    .font(.title3)
                    .foregroundStyle(storyColor)

                Text("Born on \(birthday, format: .dateTime.month(.wide).day()).")
            }

        }
    }
}
```

---

## Check yourself

- [ ] Every `@State` has a starting value
- [ ] Every `@State` type matches its control
- [ ] Every `$` is where it belongs, and nowhere it isn't
- [ ] You can explain the difference between `name` and `$name`
- [ ] The date shows as a day, not a timestamp
- [ ] You can change every control and nothing crashes
