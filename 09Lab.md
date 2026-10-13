# Lab 9: Mad Libs Machine

Open the project you built in Lab 8.

Each step shows you **one** example, then you write the rest yourself.

Run after every step. If it does not run, fix it before moving on.

---

## Step 1: Starter code

**Replace everything in `ContentView` with this.** This part is done for you.

```swift
import SwiftUI

struct ContentView: View {

    @State var name = ""

    var body: some View {
        Form {

            Section("Fill these in") {
                TextField("Your name", text: $name)
            }

            Section("Your story") {
                Text("\(name) woke up on a strange island.")
                    .font(.title3)
            }

        }
    }
}
```

**Run it. Type your name.**

---

## Step 2: Three more text boxes

You need `animal`, `place`, and `food`.

**Here is the first one. Add this `@State` line under `name`:**

```swift
@State var animal = ""
```

**And add this inside the first Section:**

```swift
TextField("An animal", text: $animal)
```

**Now write the other two yourself.** You need:

- a `@State` line and a `TextField` for `place`
- a `@State` line and a `TextField` for `food`

Follow the same shape:

```swift
@State var _____ = ""
```
```swift
TextField("_____", text: $_____)
```

**Then rewrite the story line** so it uses all four. It should end up something like:

```swift
Text("\(name) woke up on a strange island with a \(animal). They walked to \(place) and ate \(food).")
```

**Run it. Type in all four boxes.**

---

## Step 3: Two number controls

**Here is a Stepper. Add the `@State` line:**

```swift
@State var count = 1
```

**And add this inside the first Section:**

```swift
Stepper("How many: \(count)", value: $count, in: 1...50)
```

**Now you write a wheel picker for age.** Add a `@State var age = 16`, then fill in the blanks:

```swift
Picker("Age", selection: $_____) {
    ForEach(1...100, id: \.self) { number in
        Text("\(number)")
    }
}
.pickerStyle(.wheel)
.frame(height: 100)
```

**Put both numbers into the story.** Your sentence should use `\(count)` and `\(age)` somewhere.

**Run it. Tap the stepper. Spin the wheel.**

---

## Step 4: Two color controls

**Here is the first one. Add the `@State` line:**

```swift
@State var storyColor = Color.blue
```

**Add this inside the first Section:**

```swift
ColorPicker("Story color", selection: $storyColor)
```

**And add this to the story `Text`, under `.font(.title3)`:**

```swift
.foregroundStyle(storyColor)
```

**Run it. Pick a color.**

**Now you build the second one.** A `Picker` of color names.

Add these two lines near your other `@State` lines:

```swift
@State var moodColor = "Red"
let colorNames = ["Red", "Green", "Blue", "Orange"]
```

Fill in the blanks and add it to the first Section:

```swift
Picker("Mood", selection: $_____) {
    ForEach(colorNames, id: \.self) { name in
        Text(_____)
    }
}
.pickerStyle(.segmented)
```

**Now finish this function.** Put it at the very bottom of the file, **after the last `}`**:

```swift
func colorFor(name: String) -> Color {
    if name == "Red" {
        return .red
    } else if _____ {
        return .green
    } else if _____ {
        return _____
    } else {
        return .orange
    }
}
```

**Run it.** The buttons do not do anything yet. That is Step 6.

**Why you need the function:** a `Picker` of names gives you a `String`. You cannot color text with a String. `colorFor` turns `"Red"` into `.red`. It is just `if / else if / else` from Lesson 5.

---

## Step 5: A switch and a date

**No example this time. You have all the pieces.**

Add a `Toggle` so the user can pick a happy or sad ending:

```swift
@State var happyEnding = true
```
```swift
Toggle("_____", isOn: $_____)
```

Add a `DatePicker`, and remember to hide the clock:

```swift
@State var day = Date()
```
```swift
DatePicker("_____", selection: $_____, displayedComponents: _____)
```

**Put the date into your story,** formatted so it shows only a month and day. Look back at Lab 8 Step 6 if you forget how.

**Run it. Flip the switch. Change the date.** The switch does nothing yet.

---

## Step 6: The ending

**Add this inside `Section("Your story")`, under the story `Text`.** Fill in the blanks.

```swift
if _____ {
    Text("_____")
        .foregroundStyle(colorFor(name: moodColor))
} else {
    Text("_____")
        .foregroundStyle(colorFor(name: moodColor))
}
```

Write your own two endings. Make them different.

**Run it. Flip the Toggle.** The ending should swap.

**Now tap the Mood buttons.** The ending changes color.

---

## Step 7: Make the words yours

Change every piece of text so the story is yours:

- the four `TextField` labels
- the sentence itself
- both endings
- the four names in `colorNames` (and fix `colorFor` to match)

**Keep every `\( )` exactly as it is.** Only change the words around them.

**Run it after every change.**

---

## Challenge

Add a surprise line that changes with the Stepper.

```swift
let surprises = ["_____", "_____", "_____", "_____", "_____"]
```

Write five of your own. Then add this to the story Section:

```swift
Text(surprises[count - 1])
```

**Run it. Tap the stepper up to 6.** It crashes.

**Why?** Think about Lesson 3. Then fix it by changing the Stepper's range.

---

## Before you turn it in

- [ ] 4 TextFields
- [ ] 2 number controls, and they are different kinds
- [ ] 2 color controls, and they are different kinds
- [ ] 1 Toggle that swaps the ending
- [ ] 1 DatePicker showing a month and day, not a timestamp
- [ ] 2 Sections with titles
- [ ] Every control shows up somewhere in the story
- [ ] The words are yours, not mine
- [ ] Nothing crashes, no matter what you tap

---

## Stuck?

| Problem | Check this |
|---|---|
| "Cannot find `___` in scope" | You used a variable you never made a `@State` line for |
| "Cannot convert value of type..." | The type does not match the control. Lab 8, Step 3 |
| The control shows but does nothing | You forgot the `$` |
| The screen does not change when you type | You used `$name` in the `Text` instead of `name` |
| Red error on the `func` line | It has to be outside the struct, after the last `}` |
