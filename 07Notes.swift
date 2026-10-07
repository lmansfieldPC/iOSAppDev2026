import SwiftUI

struct ContentView: View {
    // We initialize variables before the body
    // We must use the @State annotation to tell Swift that we want to monitor the "state" of these variables.
    // If there state changes (ie. the values changes), the UI must be changed.
    @State var numDogs: Int = 0
    @State var numCats: Int = 0
    @State var numBirds: Int = 0
    
    var body: some View {
        VStack{
            //Title
            Text("Animals")
                .font(.title)
            //Buttons
            HStack{
                Button(action: {
                    incrementDog()
                }, label: {
                    Image(systemName: "dog")
                        .resizable()// Make the image resizable
                        .frame(width: 50, height: 50) // Set a larger size
                        .padding()
                })
                Button(action: {
                    incrementCat()
                }, label: {
                    Image(systemName: "cat")
                        .resizable()// Make the image resizable
                        .frame(width: 50, height: 50) // Set a larger size
                        .padding()
                })
                Button(action: {
                    incrementBird()
                }, label: {
                    Image(systemName: "bird")
                        .resizable()// Make the image resizable
                        .frame(width: 50, height: 50) // Set a larger size
                        .padding()
                })
            }
            //Counters
            HStack{
                Text("Dogs: \(numDogs)")
                    .padding()
                Text("Cats: \(numCats)")
                    .padding()
                Text("Birds: \(numBirds)")
                    .padding()
            }
        }
    }
    
    func incrementDog(){
        numDogs += 1
    }
    func incrementCat(){
        numCats += 1
    }
    func incrementBird(){
        numBirds += 1
    }
}
