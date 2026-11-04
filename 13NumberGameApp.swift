import SwiftUI

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
            let nudge = Int.random(in: 1...3)
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
