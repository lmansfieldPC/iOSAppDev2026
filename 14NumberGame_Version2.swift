import SwiftUI

//We're going to:
//1) Add a start button
//2) Have it also do subtraction.
//3) Add a timer

let clock = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

struct ContentView: View {
    @State var numList = [2, 2, 4, 0]    
    @State var numberListBool = true
    @State var score = 0
    @State var winner = false
    @State var start = false
    @State var timer = 0 
    
    
    var body: some View {
        VStack {
            
            Text("Number Facts Game")
                .padding(15)
            
            if !start {
                Button("Start Game"){
                    timer = 0
                    start = true
                    winner = false
                }.buttonStyle(.borderedProminent)
                
            }
            else {
                Text("\(arrayToString(numList: numList))") 
                    .padding(15)
                
                HStack{
                    Button("True"){
                        if testNumList(numList: numList) == true {
                            score = score + 1
                        }
                        else{
                            score = score - 1 
                        }
                        
                        if score >= 10 {
                            winner = true
                            start = false
                            resetGame()
                        }
                        
                        numList = generateNumList()
                        
                        
                    }
                    .buttonStyle(.borderedProminent)
                    
                    
                    Button("False"){
                        if testNumList(numList: numList) == false {
                            score = score + 1
                        }
                        else{
                            score = score - 1 
                        }
                        
                        if score >= 10 {
                            winner = true
                            start = false
                            resetGame()
                        }
                        
                        numList = generateNumList()
                    }.buttonStyle(.bordered)
                } .padding(10)
                
                Text("Score: \(score)")
                    .padding(10)
                    .background(Color.blue)
                    .clipShape(Capsule())
                
                Text("Time: \(timer)")
                    .padding(10)
                    .onReceive(clock, perform: { currentTime in
                        tick()
                    })
                
                Button("Start again"){
                    timer = 0
                    resetGame()
                } .padding(15)
                    .buttonStyle(.bordered)
                
                
            }
            
            if score > 5 {
                Text("You're on a roll!")
            }
            if winner {
                Text("You won in \(timer) seconds!")
            }
            
            
            
            
            
            
        }.padding(100)
            .font(.title)
        
        
        
        Spacer()
    }
    
    func generateNumList() -> [Int] {
        let num1 = Int.random(in: 1...9)
        let num2 = Int.random(in: 1...9)
        let sum = num1 + num2
        let difference = num1 - num2
        let answerTruth = Bool.random()
        let operation = Int.random(in: 0...1) //0 for plus, 1 for minus
        if answerTruth == true {
            if operation == 0 {
                return [num1, num2, sum, operation]
            } else {
                return [num1, num2, difference, operation]
            }
        } else {
            
            let nudges = [-1, -2, -3, 1, 2, 3]
            let index = Int.random(in: 0...5)
            let nudge = nudges[index]
            if operation == 0 {
                return [num1, num2, sum + nudge, operation]
            } else {
                return [num1, num2, sum - nudge, operation]
            }
        }
    }
    
    func arrayToString(numList: [Int]) -> String {
        if numList[3] == 0 {
            return "\(numList[0]) + \(numList[1]) = \(numList[2])"
        } else {
            return "\(numList[0]) - \(numList[1]) = \(numList[2])"
        }
    }
    
    func testNumList(numList: [Int]) -> Bool {
        if numList[3] == 0 {
            return numList[0] + numList[1] == numList[2]
        } else{
            return numList[0] - numList[1] == numList[2]
        }
    }
    func resetGame(){
        score = 0
        numList = generateNumList()
    }
    
    func tick(){
        if start == true {
            timer = timer + 1
        }
    }
}
