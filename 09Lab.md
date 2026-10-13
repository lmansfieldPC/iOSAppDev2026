# Lab 9: Mad Libs Machine

In this lab, you will build a MadLibs game. Your job is to build the controls that fill in the blanks.

Each step shows you **one** example, then you write the rest yourself.

Run after every step.

---

## Step 1: Paste the story

**Replace everything in `ContentView` with this.**

```swift
import SwiftUI

struct ContentView: View {

    // YOUR @State VARIABLES GO HERE

    var body: some View {
        Form {

            Section("Fill these in") {

                // YOUR FORM CONTROLS GO HERE

            }

            Section("Your story") {

                Text("On \(day, format: .dateTime.month(.wide).day()), \(name) woke up on a strange island with 
                a \(animal) sitting on the bed.  They hiked all the way to \(place), where somebody was handing 
                out free \(food). \(name) grabbed \(count) of them and ran. A sign on the beach said the next boat 
                leaves in \(age) days.")
                    .font(.title3)
                    .foregroundStyle(storyColor)

                if happyEnding {
                    Text("A helicopter showed up and everyone made it home by dinner.")
                        .foregroundStyle(endingColor)
                } else {
                    Text("The \(animal) took the last boat and waved goodbye.")
                        .foregroundStyle(endingColor)
                }

            }

        }
    }
}
```

**It will not run yet.** You should see a pile of red errors that all say the same thing:

> Cannot find `name` in scope

That is Swift telling you the story is using variables you have not made yet. **Your job for the rest of this lab is to make those errors go away, one group at a time.**

The story needs **10** variables. Find them all now and write them down:

```
day, name, animal, _____, _____, _____, _____, _____, _____, _____
```

---

## Step 2: The four text boxes

**Here is the first one. Add this where it says YOUR @State LINES GO HERE:**

```swift
@State var name = ""
```

**And add this where it says YOUR CONTROLS GO HERE:**

```swift
TextField("Your name", text: $name)
```

**Now write the other three yourself:** `animal`, `place`, and `food`.

Same shape every time:

```swift
@State var _____ = ""
```
```swift
TextField("_____", text: $_____)
```

The label in quotes is what the user sees, so make it tell them what to type.

**Four of your errors should disappear.** Still broken — keep going.

---

## Step 3: The two numbers

**Here is a Stepper for `count`:**

```swift
@State var count = 1
```
```swift
Stepper("How many: \(count)", value: $count, in: 1...50)
```

**Now you write a wheel picker for `age`.** Start it at 16:

```swift
@State var _____ = 16
```
```swift
Picker("Days until the boat", selection: $_____) {
    ForEach(1...100, id: \.self) { number in
        Text("\(number)")
    }
}
.pickerStyle(.wheel)
.frame(height: 100)
```

**Two more errors gone.**

---

## Step 4: The two colors

**Here is the first one:**

```swift
@State var storyColor = Color.blue
```
```swift
ColorPicker("Story color", selection: $storyColor)
```

**Now you write the second one.** It is named `endingColor` and starts red:

```swift
@State var _____ = Color.red
```
```swift
ColorPicker("_____", selection: $_____)
```

**Two more errors gone.** Two left.

---

## Step 5: The switch and the date

**No example this time. You have done all of these before.**

The story uses `happyEnding` to pick between two endings. It is either on or off, so its type is `Bool`:

```swift
@State var _____ = true
```
```swift
Toggle("_____", isOn: $_____)
```

The story uses `day` at the very beginning. Make the picker show the calendar only, no clock:

```swift
@State var _____ = Date()
```
```swift
DatePicker("_____", selection: $_____, displayedComponents: _____)
```

If you forget what goes in that last blank, check Lab 8 Step 6.

---

## Step 6: Run it

**All 10 errors should be gone.**

Go through every control and check:

- [ ] Typing in each of the four boxes changes the story
- [ ] The stepper changes how many they grabbed
- [ ] The wheel changes the number of days
- [ ] The first color picker changes the story only
- [ ] The second color picker changes the ending only
- [ ] The toggle swaps between the two endings
- [ ] The date picker changes the first words of the story
- [ ] The date shows a month and day, not a timestamp

**If one of them does nothing, you probably forgot a `$`.**

---

## Challenge

Add a surprise line that changes with the stepper.

**Add this at the very top of the struct, with your `@State` lines:**

```swift
let surprises = ["A dragon landed on the roof.",
                 "It started raining pizza.",
                 "Everyone fell asleep for a week.",
                 "The floor turned to jelly.",
                 "Nobody remembers what happened next."]
```

**Add this inside `Section("Your story")`, at the very bottom:**

```swift
Text(surprises[count - 1])
```

**Run it. Tap the stepper up to 6.** The app crashes.

**Why?** Think about Lesson 3. Then fix it by changing one number in your Stepper.

---

## Before you turn it in

- [ ] 10 `@State` lines, each with a starting value
- [ ] 10 controls in the first Section
- [ ] Zero errors
- [ ] Every control changes something in the story
- [ ] Nothing crashes, no matter what you tap

---

## Stuck?

| Problem | Check this |
|---|---|
| "Cannot find `___` in scope" | You have not made that `@State` line yet, or you spelled it differently |
| "Cannot convert value of type..." | The type does not match the control. Lab 8, Step 3 |
| The control shows but does nothing | You forgot the `$` |
| Both colors change at once | The `.foregroundStyle` is on the wrong `Text` |
| The date shows a time and a timezone | You changed the `format:` part. Put it back |
