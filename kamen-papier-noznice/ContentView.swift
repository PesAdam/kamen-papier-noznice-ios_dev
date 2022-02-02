//
//  ContentView.swift
//  kamen-papier-noznice
//
//  Created by Bender on 31/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            
            CustomButton(choice: .kamen)
            CustomButton(choice: .papier)
            CustomButton(choice: .noznice)
            
            /*Image(systemName: "octagon.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
       
            Image(systemName: "newspaper.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
             */
        }
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
    
    var body: some View {
        Button{
            print(choice)
        } label: {
            Image(systemName: choice.rawValue )
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .foregroundColor(.black)
        }
    }
}
