//
//  ContentView.swift
//  viewMods
//
//  Created by Kat Allee on 3/3/21.
//

import SwiftUI

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(20)
    }
}

struct ContentView: View {
    @State private var useRedText = false
    @State private var blurAmount: CGFloat = 0
    var motto1 = Text("Ad Astra per Aspera")
    
    var body: some View {
//        VStack {
//            Text("Gryffindor")
//                .blur(radius: 6)
//                .foregroundColor(.red)
//            Text("Hufflepuff")
//                .foregroundColor(.yellow)
//            Text("Ravenclaw")
//                .foregroundColor(.blue)
//            Text("Slytherin")
//                .foregroundColor(.green)
//        }
//        .blur(radius: 5)
        VStack {
            CapsuleText(text: "Hello World")
            motto1
            Button("End Capitalism") {
                //self. needed on versions of
                //xcode older than version 12
                useRedText.toggle()
                blurAmount += 1
                if blurAmount > 20 {
                    blurAmount = 0
                }
            }
            .accentColor(.white)
            .padding()
            //ternary operator is a condensed
            //if statement
            //test ? true : false
            .background(useRedText ? Color.red: Color.blue)
            .cornerRadius(10)
            .accentColor(.white)
        }
        blur(radius: blurAmount)
//        //or you can use .padding instead of .frame
//        .frame(width: 200, height: 200, alignment: .center)
//        .background(Color.green)
//        .cornerRadius(50)
//        .frame(width: 250, height: 150, alignment: .center)
//        .background(Color.gray)
//        .cornerRadius(100)
        
        //Text("Views and Modifiers")
            //.frame(maxWidth: .infinity, maxHeight: .infinity)
            //make sure frame comes before background color if you want the color to apply
            //to the entire frame. otherwise the frame will be emptuy and the background
            //will only apply to the text background
            //. is an enum
            //frame and infinity makes background color resize to fill entire screen,
            //otherwise, background color only applies to text's imediate background
            //right click on variable to jump to the definition
            //.background(Color.red)
            //.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
