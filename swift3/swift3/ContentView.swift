//
//  ContentView.swift
//  swift3
//
//  Created by David King on 6/22/22.
//

import SwiftUI

struct ContentView: View {
    // properties
    @State private var playerCard = "card6"
    @State private var cpuCard = "card12"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    // view properties
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300.0, height: 70.0)
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:125.0, height:160.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .shadow(color: Color.black, radius: 10.0, x: 5.0, y: 6.0)
                    Spacer()
                    Image(cpuCard)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:125.0, height:160.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .shadow(color: Color.black, radius: 10.0, x: 2.0, y: 2.0)

                    Spacer()
                }
                Spacer()
                Button(action: {
                    handlePlay()
                }, label: {
                    Image("start")
                        .resizable(capInsets: EdgeInsets())
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100.0, height: 100.0)
                })
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("player")
                            .font(.system(size:40.0))
                        Text(String(playerScore))
                            .font(.system(size:60,weight: Font.Weight.thin))
                    }
                    Spacer()
                    VStack{
                        Text("cpu")
                            .font(.system(size:40.0))
                        Text(String(cpuScore))
                            .font(.system(size:60,weight: Font.Weight.thin))
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    // methods
    func handlePlay(){
        // generate random number between 2 and 14
        let playerRandom = Int.random(in: 2...14)
        let cpuRandom = Int.random(in:2...14)
        
        playerCard = "card" + String(playerRandom)
        cpuCard = "card" + String(cpuRandom)
        
        if playerRandom > cpuRandom {
            playerScore += 1
        }
        else if cpuRandom > playerRandom {
            cpuScore += 1
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
