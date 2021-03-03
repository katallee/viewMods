//
//  ContentView.swift
//  ViewMods
//
//  Created by Kat Allee on 3/3/21.
//
import SwiftUI

struct CapsuleText: View {
    var givenText: String

    var body: some View {
        Text(givenText)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(20)
    }
}
//creating our own view modifier
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.purple)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
//changing ".modifier(Title()) to .titleStyle()
extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

//Creating custom container
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }//end of hstack foreach
                }//end of hstack
            }//end of vstack foreach
        }//end of vstack
    }//end of body
}//end of gridStack

//struct Watermark: ViewModifier {
//    var text: String
//
//    func body(content: Content) -> some View {
//        ZStack(alignment: .bottomTrailing) {
//            content
//            Text(text)
//                .font(.caption)
//                .foregroundColor(.white)
//                .padding(5)
//                .background(Color.black)
//        }
//    }
//}
//
//extension View {
//    func watermarked(with text: String) -> some View {
//        self.modifier(Watermark(text: text))
//    }
//}

struct ContentView: View {
    //@State private var counter = 0
    @State private var useRedText = false
    @State private var blurAmount: CGFloat = 0
    
    var motto1 = Text("Ad Astra Per Aspera")
    
//    var blurButton = Button("asdf")

    var body: some View {
        VStack(spacing: 20) {
            GridStack(rows: 3, columns: 3) {row, col in
                Text("R\(row), C\(col)")
            }
            CapsuleText(givenText: "Hello World")
            CapsuleText(givenText: "Game Over")
            motto1
                .bold()
                .titleStyle()
            Button("Hello world") {
                self.useRedText.toggle()     // switch the boolean's value
                self.blurAmount += 1
                if blurAmount > 20 {
                    blurAmount = 0
                }
            }
            .accentColor(.white)
            .padding()
            //.watermarked(with: "Hacking with Swift") --to use watermark struct
            
            // ternary operator is a condensed if statement.
            // test ? do this if true : do this if false
            .background(useRedText ? Color.red : Color.blue)
            .cornerRadius(10)
            .blur(radius: blurAmount)
        }
        
        
//        Button("Hello banana") {
//            //Text("I have been pressed \(counter) times.")
//        }
//        .accentColor(.white)
//        .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//        .background(Color.green)
//        .cornerRadius(50)
//        .frame(width: 250, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//        .background(Color.gray)
//        .cornerRadius(100)
        
        
        
        
        
        
        
        
        
        
//        Text("Views and Modifiers!")
//            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
//            .background(Color.red)
//            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
