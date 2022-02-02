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
    @State var opponentsChoiceIsShow: Bool = false
    @State var showingresult: Bool = false
    
    var randomChoice: Choice {
        let choices: [Choice] = [.kamen, .papier, .noznice]
        
        let randomIndex = Int.random(in: 0...2)
        
        return choices[randomIndex]
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    ZStack {
                        Rectangle()
                            .frame(height: geo.size.height / 2)
                            .foregroundColor(Color.black)
                        
                        if opponentsChoiceIsShow {
                            Image(systemName: opponentsChoice.rawValue)
                                .resizable()
                                .foregroundColor(.white)
                                .scaledToFit()
                                .frame(height: geo.size.height / 3)
                                .padding()
                        } else{
                            Button{
                                opponentsChoice = randomChoice
                                opponentsChoiceIsShow = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                                    withAnimation(.spring()){
                                        showingresult = true
                                    }
                                }
                                
                            } label: {
                                Text("PLAY")
                                    .font(.system(size: 75, weight: .bold))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .frame(height: geo.size.height / 2)
                            .foregroundColor(Color.white)
                        VStack {
                            Image(systemName: myChoice.rawValue)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.black)
                                .frame(height: geo.size.height / 3)
                            .padding()
                        }
                        
                        
                        HStack(spacing: 40){
                            
                            CustomButton(choice: .kamen, myChoice: $myChoice)
                            CustomButton(choice: .papier, myChoice: $myChoice)
                            CustomButton(choice: .noznice, myChoice: $myChoice)
                            
                        }
                    }
                }
            }
            
            Text(getResult().rawValue.uppercased())
                .padding(50)
                .font(.system(size: 75, weight: .bold))
                .foregroundColor(.blue)
                .background(Color.black)
                .border(Color.white, width: 3)
                .cornerRadius(3, antialiased: true)
                .offset(x: showingresult ? 0 : -400)
                .onTapGesture {
                    opponentsChoiceIsShow = false
                    withAnimation(.spring()){
                        showingresult = false
                    }
                    
                }
        } .edgesIgnoringSafeArea(.all)
    }
    
    func getResult() -> Result{
        switch opponentsChoice {
        case .kamen:
            switch myChoice {
            case .kamen:
                return .draw
            case .noznice:
                return .loose
            case .papier:
                return .win
            }
        case .noznice:
            switch myChoice {
            case .kamen:
                return .win
            case .noznice:
                return .draw
            case .papier:
                return .loose
            }
            
        case .papier:
            switch myChoice {
            case .kamen:
                return .loose
            case .noznice:
                return .win
            case .papier:
                return .draw
            }
        }
    }
}

//enumeraciae
enum Result : String {
    case win
    case loose
    case draw
}


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
