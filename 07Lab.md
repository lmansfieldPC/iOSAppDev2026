# Lab 10 SwiftUI Basics: Food Ordering App Assignment

## Objective
Create a simple food ordering app using SwiftUI that allows users to add different food items to their order and see the total cost.

## Description
In this lab, you will create an app that displays three different food options. The user can tap on buttons to add foods to their order. The app will display the total cost of the food items.

## Process
1. Create a new app in Playground.

2. Follow the example code in Class Notes 7. You will have to create three buttons representing three different foods.

3. When the user clicks a food button, the cost of that food is added to their total cost. 


## Starter Code

You can begin with this basic structure and expand upon it:

```swift
import SwiftUI

struct ContentView: View {
    @State private var pizzaCount = 0
    @State private var burgerCount = 0
    @State private var saladCount = 0
    
    let pizzaPrice = 10.0
    let burgerPrice = 8.5
    let saladPrice = 6.0
    
    var body: some View {
        VStack {
            Text("Food Order")
                .font(.largeTitle)
            
            // TODO: Add food item buttons here
            
            // TODO: Display the total cost.
        }
    }

    //TODO: Add a function to calculate the total cost.
    
}
```

## Bonus Challenges

1. Add a "Reset Order" button that clears all counts and resets the total to zero.
2. Add some custom formatting.


## Submission

Submit your code to the Hub by copying and pasting your code into the textbox.
