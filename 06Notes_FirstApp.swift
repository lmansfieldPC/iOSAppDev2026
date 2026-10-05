import SwiftUI



struct ContentView: View {
    
    var myBlue = Color(red:93/255,green:63/255, blue:211/255)
    
    var body: some View {
        
        ZStack{
            Color.mint.frame(width: 600, height: 600)
                .clipShape(RoundedRectangle(cornerRadius: 20))     // rounded
            
            
            VStack{
            Text("Hello, friends!")
                .padding()
                .font(.largeTitle)
                .foregroundStyle(myBlue)
                .background(Color.white)
                .clipShape(Capsule())
                .padding()
            
                
                VStack{
                    Text("Number 1")
                    Text("Number 2")
                    Text("Number 3")
                }
                .padding(50)
                
                .foregroundStyle(.green)
                .font(.title)
                .background(.red)
                
                .clipShape(Circle())
                
                .padding()
                
                HStack{
                    Text("Number 1")
                    Text("Number 2")
                    Text("Number 3")
                }  .padding()
                    .foregroundStyle(.red)
                    .font(.title)
                    .background(.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
            }
            
            
        }
        
        
        
    }
}
