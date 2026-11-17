//EXAMPLE CODE

import SwiftUI

struct ContentView: View {
    @State var scores = [85, 92, 75]
    @State var newScore = 0
    var body: some View {
        
            VStack(spacing: 10) {
              
                Text("Quiz Scores")
                    .font(.title)
                
                HStack{
                    scoreField()
                    
                    Button("Add"){
                        scores.append(newScore)
                    }.buttonStyle(.borderedProminent)
                }
               
                ZStack{
                    ScrollView{
                        VStack{
                            Section("Scores"){
                                ForEach(0..<scores.count, id:\.self){ i in 
                                    HStack{
                                        Text("Quiz \(i+1)")
                                        Spacer()
                                        Text("\(scores[i])")
                                    }
                                    
                                    
                                    
                                }
                            }
                        }
                    }.padding()
                        .background(Color.red.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                    
                ZStack{
                    VStack{
                        Section("Stats"){
                            HStack{
                                Text("No. Quizzes")
                                Spacer()
                                Text("\(scores.count)")
                            }
                            HStack{
                                Text("Average Score")
                                Spacer()
                                Text("\(average(scores: scores))")
                            }
                            HStack{
                                Text("Highest Score")
                                Spacer()
                                Text("\(scores.max() ?? 0)")
                            }
                        }
                    }
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                
                Section {
                    Button("Clear all") {
                        scores.removeAll()
                    }
                    .buttonStyle(.bordered)
                    .foregroundStyle(.red)
                }
                
                
            }.padding(60)
            
        }
    
    func scoreField() -> some View {
        TextField("New", value: $newScore, format: .number)
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.center)
            .frame(width: 50)
    }
    
    func average(scores: [Int]) -> String {
        if scores.count == 0 {
            return "0.0"
        }
        
        var total = 0
        for score in scores {
            total = total + score
        }
        let average = Double(total)/Double(scores.count)
        return String(format: "%.1f", average)

    }
    
}
