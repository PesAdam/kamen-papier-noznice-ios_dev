//
//  ContentView.swift
//  kamen-papier-noznice
//
//  Created by Bender on 31/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var myChoice: Choice = .kamen
    @State var opponentsChoice: Choice = .papier
    
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack {
                    Rectangle()
                        .frame(height: geo.size.height / 2)
                    Image(systemName: opponentsChoice.rawValue)
                        .resizable()
                        .foregroundColor(.white)
                        .scaledToFit()
                        .frame(height: geo.size.height / 3)
                        .padding()
                }
                
                Image(systemName: myChoice.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(height: geo.size.height / 3)
                    .padding()
                
                HStack(spacing: 40){
                    
                    CustomButton(choice: .kamen, myChoice: $myChoice)
                    CustomButton(choice: .papier, myChoice: $myChoice)
                    CustomButton(choice: .noznice, myChoice: $myChoice)
                    
                }
            }
        } .edgesIgnoringSafeArea(.all)
    }
}

//enumeracia
enum Choice : String {
    case kamen = "octagon.fill"
    case noznice = "scissors"
    case papier = "newspaper.fill"
}

//aby som sa neopakoval ako retard pouzil som extract subview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomButton: View {
    let choice: Choice
    @Binding var  myChoice: Choice
    
    var isPicked:Bool {
        return choice == myChoice
    }
    
    var body: some View {
        Button{
            print(choice)
            myChoice = choice
        } label: {
            Image(systemName: choice.rawValue )
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .foregroundColor(isPicked ? .red : .black)
        }
    }
}
