//
//  ContentView.swift
//  kamen-papier-noznice
//
//  Created by Bender on 31/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
        
            Image(systemName: "scissors")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
            
            Image(systemName: "scissors")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
       
            Image(systemName: "scissors")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
