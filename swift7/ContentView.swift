//
//  ContentView.swift
//  swift7
//
//  Created by David King on 6/29/22.
//

import SwiftUI

struct ContentView: View {
    private var symbols = ["🍒","⭐️","🍉"]
    private var betAmount = 5
    @State private var credits = 1000
    @State private var slotOutput = [0,0,0]
    
    
    func handleSpin(){
        
        // randomly select slots
        let slot1 = Int.random(in: 0...symbols.count - 1)
        let slot2 = Int.random(in: 0...symbols.count - 1)
        let slot3 = Int.random(in: 0...symbols.count - 1)
        
        slotOutput[0] = slot1
        slotOutput[1] = slot2
        slotOutput[2] = slot3
        
        if slot1 == slot2 && slot2 == slot3 {
            credits += betAmount * 10
        } else {
            credits -= betAmount
        }
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color(red:250/255,green:143/255,blue:32/255))
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(red:28/255,green:135/255,blue:196/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)

            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .scaleEffect(2)
                    Spacer()
                    Text("SwiftUI Slots")
                        .bold()
                        .padding(.horizontal,25)
                        .padding(.vertical,10)
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .background(.white.opacity(0.5))
                        .cornerRadius(20)
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .scaleEffect(2)
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    Text("Credits: " + String(credits))
                        .foregroundColor(.black)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 15)
                        .background(.white.opacity(0.5))
                        .cornerRadius(20)
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    Text(String(symbols[slotOutput[0]]))
                        .padding(.all,10)
                        .background(.white.opacity(0.5))
                        .font(.custom("Cherry",fixedSize: 80))
                        .cornerRadius(10)
                    Text(String(symbols[slotOutput[1]]))
                        .padding(.all,10)
                        .background(.white.opacity(0.5))
                        .font(.custom("Cherry",fixedSize: 80))
                        .cornerRadius(10)
                    Text(String(symbols[slotOutput[2]]))
                        .padding(.all,10)
                        .background(.white.opacity(0.5))
                        .font(.custom("Cherry",fixedSize: 80))
                        .cornerRadius(10)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    handleSpin()
                }){
                    Text("Spin")
                        .padding(.horizontal,50)
                        .padding(.vertical,10)
                        .background(.pink)
                        .font(.headline)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
