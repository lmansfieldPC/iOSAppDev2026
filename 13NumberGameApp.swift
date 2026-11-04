import SwiftUI

//Your assignment -
//Change the app so that 
//1) When you get 10 points the game automatically resets and the winner gets a message stating they won.
//2) The number sentence is sometimes a subtraction.


struct ContentView: View {
    @State var numList = [2, 2, 4]
    @State var numberListBool = true
    @State var score = 0

    
    var body: some View {
        VStack {
            
            Text("Number Facts Game")
                .padding(15)
              
            
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
                    numList = generateNumList()
                }.buttonStyle(.bordered)
            } .padding(10)
            
            Text("Score: \(score)")
                .padding(10)
                .background(Color.blue)
                .clipShape(Capsule())
            
            if score > 5 {
                  Text("You're on a roll!")
            }
          
           
            
            Button("Play Again"){
                resetGame()
            } .padding(15)
            .buttonStyle(.bordered)

        }.padding(100)
        .font(.title)

        
           
        Spacer()
    }
    
    func generateNumList() -> [Int] {
        let num1 = Int.random(in: 1...9)
        let num2 = Int.random(in: 1...9)
        let sum = num1 + num2
        let answerTruth = Bool.random()
        if answerTruth == true {
            return [num1, num2, sum]
        } else {
            let nudges = [-1, -2, -3, 1, 2, 3]
            let index = Int.random(in: 0...5)
            let nudge = nudges[index]
            return [num1, num2, sum + nudge]
        }
    }
    
    func arrayToString(numList: [Int]) -> String {
        return "\(numList[0]) + \(numList[1]) = \(numList[2])"
    }
    
    func testNumList(numList: [Int]) -> Bool {
        return numList[0] + numList[1] == numList[2]
    }
    func resetGame(){
        score = 0
        numList = generateNumList()
    }
}
