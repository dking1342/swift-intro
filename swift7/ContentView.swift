//
//  ContentView.swift
//  swift7
//
//  Created by David King on 6/29/22.
//

import SwiftUI
import Combine
import Collections
import OrderedCollections

struct ContentView: View {

    @State var symbols = ["🍒","⭐️","🍉","🍊","🍋","💰","🎰","💎"]
    @State var slotOutput = [[0,1,2],[2,1,0],[0,1,2]]
    @State var slotBgColors = [
        [Color.white,Color.white,Color.white],
        [Color.white,Color.white,Color.white],
        [Color.white,Color.white,Color.white]
    ]
    @State private var credits = 50
    @State private var canPlay = true
    @State private var hasCredits = true
    @State var betAmount = ["amount":0,"winner":0]
    @State var bgColor = Color.green
    @State var isWinner = false
    
    func resetBoard(){
        // randomly select slots
        slotOutput = slotOutput.map{(data:[Int]) in
            return data.map{_ in Int.random(in: 0...symbols.count - 1)}
        }
        
        // reset tile colors
        slotBgColors = slotBgColors.map{(data:[Color]) in
            return data.map{_ in Color.white}
        }
    }
    
    func changeTileColors(slot1:[Int],slot2:[Int],slot3:[Int],color:Color){
        slotBgColors[slot1[0]][slot1[1]] = color
        slotBgColors[slot2[0]][slot2[1]] = color
        slotBgColors[slot3[0]][slot3[1]] = color
    }
    
    func checkPossible(slot1:[Int],slot2:[Int],slot3:[Int],color:Color) -> Bool{
        if slotOutput[slot1[0]][slot1[1]] == slotOutput[slot2[0]][slot2[1]] && slotOutput[slot2[0]][slot2[1]] == slotOutput[slot3[0]][slot3[1]] {

            changeTileColors(slot1: slot1, slot2: slot2, slot3: slot3, color: color)
            return true
        } else {
            return false
        }
    }
    
    
    func handleSpin(type:String){
        // reset
        isWinner = false
        hasCredits = true

        // bet setup
        if type == "small" {
            betAmount["amount"] = 1
            betAmount["winner"] = 5
            bgColor = Color.green
        } else {
            betAmount["amount"] = 25
            betAmount["winner"] = 50
            bgColor = Color.red
        }
        
        if credits < betAmount["amount"]! {
            canPlay = false
        } else {
            canPlay = true
        }
        if credits <= 0 {
            hasCredits = false
        } else {
            hasCredits = true
        }
        
        if canPlay && hasCredits {
            
            credits -= betAmount["amount"]!
            resetBoard()
            
            var winningPossible:[Bool] = []
            
            // horizonatal
            winningPossible.append(checkPossible(slot1: [0,0], slot2: [0,1], slot3: [0,2], color:Color.green))
            winningPossible.append(checkPossible(slot1: [1,0], slot2: [1,1], slot3: [1,2], color:Color.green))
            winningPossible.append(checkPossible(slot1: [2,0], slot2: [2,1], slot3: [2,2], color:Color.green))

            // diagonal
            winningPossible.append(checkPossible(slot1: [0,0], slot2: [1,1], slot3: [2,2], color:Color.green))
            winningPossible.append(checkPossible(slot1: [0,2], slot2: [1,1], slot3: [2,0], color:Color.green))

            // vertical
            winningPossible.append(checkPossible(slot1: [0,0], slot2: [1,0], slot3: [2,0], color: Color.green))
            winningPossible.append(checkPossible(slot1: [0,1], slot2: [1,1], slot3: [2,1], color: Color.green))
            winningPossible.append(checkPossible(slot1: [0,2], slot2: [1,2], slot3: [2,2], color: Color.green))
            
            let isWinnerCombo = winningPossible.filter{ $0 == true }
            
            if !isWinnerCombo.isEmpty {
                isWinner = true
                if isWinnerCombo.count <= 4 {
                    credits += betAmount["winner"]! * isWinnerCombo.count
                } else {
                    credits += betAmount["winner"]! * 20
                }
            }
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
                    VStack{
                        Text("Credits: " + String(credits))
                            .frame(width: hasCredits ? 150 : 0, height: hasCredits ? 50 : 0)
                            .foregroundColor(.black)
                            .background(isWinner ? Color.green.opacity(0.5) : Color.white.opacity(0.5))
                            .cornerRadius(20)
                            .animation(.none, value: isWinner)
                            .scaleEffect(isWinner ? 1.2 : 1)
                            .animation(.spring(response: 0.7, dampingFraction: 0.3), value: isWinner)
                        Text("Not enough credit to spin!")
                            .frame(width: canPlay ? 0 : 300, height: canPlay ? 0 : 50)
                            .foregroundColor(.white)
                            .font(.title3)
                            .background(.red.opacity(0.7))
                            .animation(.none, value: canPlay)
                            .cornerRadius(20)
                            .scaleEffect(canPlay ? 1.2 : 1)
                            .animation(.spring(response: 0.35, dampingFraction: 0.6), value: canPlay)

                    }
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        SlotRowView(symbols: $symbols, slotsArray: $slotOutput[0], color: $slotBgColors[0])
                        SlotRowView(symbols: $symbols, slotsArray: $slotOutput[1], color: $slotBgColors[1])
                        SlotRowView(symbols: $symbols, slotsArray: $slotOutput[2], color: $slotBgColors[2])
                    }

                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Button(action: {
                            handleSpin(type: "small")
                        }){
                            Text("Spin")
                                .padding(.horizontal,50)
                                .padding(.vertical,10)
                                .background(.pink)
                                .font(.headline)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                        Text("Credit: 1")
                            .font(.headline)
                    }
                    Spacer()
                    VStack{
                        Button(action: {
                            handleSpin(type: "big")
                        }){
                            Text("Big Spin")
                                .padding(.horizontal,50)
                                .padding(.vertical,10)
                                .background(.green)
                                .font(.headline)
                                .foregroundColor(.black)
                                .cornerRadius(20)
                        }
                        Text("Credit: 25")
                            .font(.headline)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .animation(.easeInOut(duration: 0.45), value: slotOutput)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
