# Lab 9: Mad Libs Machine

You are building this in three parts:

1. **Make the variables.** All ten of them, before anything else.
2. **Make the controls.** One for each variable.
3. **Paste in the story.** It is already written for you.

Run after every step.

---

# Part 1: The variables

## Step 1: Empty shell

**Replace everything in `ContentView` with this.**

```swift
import SwiftUI

struct ContentView: View {

    // Step 2 goes here

    var body: some View {
        Form {

            Section("Fill these in") {

                // Part 2 goes here

            }

            Section("Your story") {

                // Part 3 goes here

            }

        }
    }
}
```

**Run it.** You get an empty gray screen with two headings. That is correct.

---

## Step 2: Write all ten variables

This app needs ten pieces of information from the user. **Every one needs a `@State` line with a starting value.**

**Here is the first one. Put it where it says "Step 2 goes here":**

```swift
@State var name = ""
```

**Now write the other nine from this table.** Same shape every time: `@State var` then the name, then `=`, then the starting value.

| Variable | Type | Starting value to use |
|---|---|---|
| `name` | String | `""` |
| `animal` | String | `""` |
| `place` | String | `""` |
| `food` | String | `""` |
| `count` | Int | `1` |
| `age` | Int | `16` |
| `happyEnding` | Bool | `true` |
| `day` | Date | `Date()` |
| `storyColor` | Color | `Color.blue` |
| `endingColor` | Color | `Color.red` |

**You never type the Type column.** Swift figures the type out from the starting value. `""` makes a String, `1` makes an Int, `true` makes a Bool. The column is there so you know what each one is.

**Run it.** Still an empty screen, but no errors. **Ten `@State` lines, no errors, before you go on.**

---

# Part 2: The controls

Every control goes inside `Section("Fill these in")`.

## Step 3: The four text boxes

**Here is the first one:**

```swift
TextField("Your name", text: $name)
```

**Now write three more**, for `animal`, `place`, and `food`:

```swift
TextField("_____", text: $_____)
```

The words in quotes are what the user sees, so make them tell the user what to type.

**Run it. Type in all four boxes.** Nothing happens anywhere else yet. That is fine — there is no story to change.

---

## Step 4: The two numbers

**Here is a stepper for `count`:**

```swift
Stepper("How many: \(count)", value: $count, in: 1...50)
```

**Now write a spinning wheel for `age`:**

```swift
Picker("Days until the boat", selection: $_____) {
    ForEach(1...100, id: \.self) { number in
        Text("\(number)")
    }
}
.pickerStyle(.wheel)
.frame(height: 100)
```

**Run it. Tap the stepper. Spin the wheel.**

---

## Step 5: The two colors

**Here is the first one:**

```swift
ColorPicker("Story color", selection: $storyColor)
```

**Now write the second one, for `endingColor`:**

```swift
ColorPicker("_____", selection: $_____)
```

**Run it. Open both color wheels.**

---

## Step 6: The switch and the date

**No example this time.**

`happyEnding` is a `Bool`, so it needs a `Toggle`:

```swift
Toggle("_____", isOn: $_____)
```

`day` is a `Date`, so it needs a `DatePicker`. The last blank hides the clock — check Lab 8 Step 6 if you forget it:

```swift
DatePicker("_____", selection: $_____, displayedComponents: _____)
```

**Run it. Flip the switch. Open the calendar.**

**You should now have ten controls and zero errors.** Count them before you go on.

---

# Part 3: The story

## Step 7: Paste it in

**You do not write any of this.** Put it where it says "Part 3 goes here", inside `Section("Your story")`.

```swift
VStack(alignment: .leading, spacing: 12) {

    Text("On \(day, format: .dateTime.month(.wide).day()), \(name) woke up on a strange island.")

    Text("A \(animal) was sitting on the bed, holding a map.")

    Text("They hiked all the way to \(place), where somebody was handing out free \(food).")

    Text("\(name) grabbed \(count) of them and ran.")

    Text("A sign on the beach said the next boat leaves in \(age) days.")

}
.font(.title3)
.foregroundStyle(storyColor)

if happyEnding {
    Text("A helicopter showed up and everyone made it home by dinner.")
        .foregroundStyle(endingColor)
} else {
    Text("The \(animal) took the last boat and waved goodbye.")
        .foregroundStyle(endingColor)
}
```

**Run it.** It should work right away, because you already made all ten variables in Part 1.

**If you get "Cannot find `___` in scope":** that variable is missing from Part 1, or you spelled it differently. Go back to the table in Step 2.

---

## Step 8: Try everything

Go down the list and check each one:

- [ ] Typing in each of the four boxes changes the story
- [ ] The stepper changes how many they grabbed
- [ ] The wheel changes the number of days
- [ ] The first color picker changes the story only
- [ ] The second color picker changes the ending only
- [ ] The toggle swaps between the two endings
- [ ] The date picker changes the first words of the story
- [ ] The date shows a month and day, not a timestamp

**If a control does nothing, you probably forgot a `$`.**

---

## Challenge

Add a surprise line that changes with the stepper.

**Add this with your `@State` lines in Part 1:**

```swift
let surprises = ["A dragon landed on the roof.",
                 "It started raining pizza.",
                 "Everyone fell asleep for a week.",
                 "The floor turned to jelly.",
                 "Nobody remembers what happened next."]
```

**Add this at the bottom of `Section("Your story")`:**

```swift
Text(surprises[count - 1])
```

**Run it. Tap the stepper up to 6.** The app crashes.

**Why?** Think about Lesson 3. Then fix it by changing one number in your Stepper.

**One more thing to notice:** `surprises` is a `let`, not a `@State`. The five sentences never change, so it does not need to be `@State`. Only things the user can change need that.

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
| "Cannot find `___` in scope" | That `@State` line is missing, or spelled differently |
| "Cannot convert value of type..." | The starting value is the wrong type. Check the table in Step 2 |
| The control shows but does nothing | You forgot the `$` |
| Both colors change at once | The `.foregroundStyle` is on the wrong thing |
| The date shows a time and a timezone | You changed the `format:` part. Put it back |
