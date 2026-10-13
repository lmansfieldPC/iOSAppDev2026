import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var birthday: Date = Date.now
    @State var age: Int = 0 
    @State var student: Bool = false
    @State var color1: Color = Color.blue
    @State var color2: Color = Color.green
    
    var body: some View {
        
        ZStack{
            LinearGradient(colors: [color1, color2], startPoint: .top, endPoint: .bottom)
            
            Form{
                TextField("Your Name", text: $name)
                DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                Stepper("Age: \(age)", value: $age, in: 1...120)
                Toggle("Student", isOn: $student)
                ColorPicker("Pick a color", selection: $color1)
                ColorPicker("Pick a color", selection: $color2)
            } .scrollContentBackground(.hidden)
            
            VStack{
                Text("Hello, \(name). You are \(age) years old!")
                Text("You are \(student ? "a student." : "not a student.")")
                Text("Your birthday is on \(birthday, format: .dateTime.day().month(.wide).year()).")
            }
            
        }
    }
}
