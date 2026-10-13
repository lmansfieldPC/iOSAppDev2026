# Lab 8: Building a Form


Do every step in order. Run after every step.

---

## Step 1

**Type this.** Replace everything in `ContentView`.

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

**Run it. Type your name.** The greeting should change as you type.

**Why it works:**
- `@State` = this value can change, and the screen redraws when it does.
- `= ""` is the starting value. Every `@State` needs one.
- `$name` = the TextField can **change** it. `name` = you are only **reading** it.

**Try it:** delete the `$` from `$name`. Run. Read the error. Put it back.

---

## Step 2

**Add one line** to your `@State` list:

```swift
@State var animal = ""
```

**Add one line** inside the `Form`, under the first TextField:

```swift
TextField("An animal", text: $animal)
```

**Replace** the `Text` line with:

```swift
Text("\(name) woke up and found a \(animal) in the kitchen.")
```

**Run it. Type in both boxes.**

**Why it works:** one `@State` per box. The sentence uses `\( )` from Lesson 1.

**Try it:** add a third box for a place. Put it in the sentence.

---

## Step 3

**Add one line** to your `@State` list:

```swift
@State var count = 1
```

**Add one line** inside the `Form`:

```swift
Stepper("How many: \(count)", value: $count, in: 1...50)
```

**Run it. Tap plus and minus.**

**Why it works:** a TextField gives you a `String`. You cannot do math with a String. `Stepper` gives you an `Int`. `in: 1...50` is the lowest and highest it will go.

**The type must match the control:**

| Control | Type |
|---|---|
| `TextField` | `String` |
| `Stepper` | `Int` |
| `Slider` | `Double` |
| `Toggle` | `Bool` |
| `ColorPicker` | `Color` |
| `DatePicker` | `Date` |

**Try it:** add these two lines. Run.

```swift
@State var loudness = 0.0
```
```swift
Slider(value: $loudness, in: 0...10)
```

Now change `0.0` to `0`. Run. Read the error. Change it back to `0.0`.

---

## Step 4

**Add one line** to your `@State` list:

```swift
@State var storyColor = Color.blue
```

**Add one line** inside the `Form`:

```swift
ColorPicker("Story color", selection: $storyColor)
```

**Add one line** under your sentence:

```swift
.foregroundStyle(storyColor)
```

**Run it. Pick a color.** Only the sentence should change color.

**Why it works:** `$storyColor` where the user picks it. `storyColor` where you use it. Same rule as Step 1.

**Try it:** move `.foregroundStyle(storyColor)` down so it is attached to the whole `Form` instead. Run. Everything turns that color. Move it back onto the `Text`.

---

## Step 5

**Wrap your controls in Sections.** Your `Form` should now look exactly like this:

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

**Run it.** You should see two gray headings.

**Why it works:** `Section` groups things under a title. It changes where things sit, not what they do.

---

## Step 6

**Add one line** to your `@State` list:

```swift
@State var birthday = Date()
```

**Add one line** to the first Section:

```swift
DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
```

**Add one line** to the second Section:

```swift
Text("Born on \(birthday).")
```

**Run it.** The date looks terrible. It shows a time and a timezone.

**Now fix it.** Replace that line with:

```swift
Text("Born on \(birthday, format: .dateTime.month(.wide).day()).")
```

**Run it again.**

**Why it works:** a `Date` holds way more than you want to show. `format:` says which pieces to print.

**Other pieces you can use:**

```swift
.day()                 // 13
.month(.wide)          // October
.month(.abbreviated)   // Oct
.weekday(.wide)        // Tuesday
.year()                // 2026
```

**Try it:** change the format to show the weekday instead.

---

## Done. Check your file.

It should look like this. **Save it. You need it next class.**

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

**Before you leave:**

- [ ] 5 `@State` lines, each with a starting value
- [ ] 2 Sections with titles
- [ ] The date shows a month and day, not a timestamp
- [ ] You can change every control and nothing crashes
- [ ] You can say out loud what the `$` does
