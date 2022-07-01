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
    @State private var credits = 1000
    @State private var canPlay = true
    private var smallBetAmount = ["amount":1,"winner":15]
    private var bigBetAmount = ["amount":25,"winner":500]

    
    
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
    
    
    func checkSmallWinner(){
        canPlay = true
        if credits - smallBetAmount["amount"]! >= 0 {
            credits -= smallBetAmount["amount"]!
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
                credits += smallBetAmount["winner"]!
            }
        } else {
            canPlay = false
        }
    }
    
    
    func checkBigWinner(){
        canPlay = true
        if credits - bigBetAmount["amount"]! >= 0 {
            credits -= bigBetAmount["amount"]!
            resetBoard()
            var winningPossible:[Bool] = []

            winningPossible.append(checkPossible(slot1: [1,0], slot2: [1,1], slot3: [1,2],color:Color.white))
            winningPossible.append(checkPossible(slot1: [0,0], slot2: [1,1], slot3: [2,2],color:Color.white))
            winningPossible.append(checkPossible(slot1: [0,2], slot2: [1,1], slot3: [2,0],color:Color.white))
            
            let isWinnerCombo = winningPossible.filter{ $0 == true}
            
            if isWinnerCombo.count == 3 {
                credits += bigBetAmount["winner"]!
                changeTileColors(slot1: [1,0], slot2: [1,1], slot3: [1,2], color: Color.red)
                changeTileColors(slot1: [0,0], slot2: [1,1], slot3: [2,2], color: Color.red)
                changeTileColors(slot1: [0,2], slot2: [1,1], slot3: [2,0], color: Color.red)
            }
        } else {
            canPlay = false
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
                            .foregroundColor(.black)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 15)
                            .background(.white.opacity(0.5))
                            .cornerRadius(20)
                        if !canPlay {
                            Text("Not enough credit to play!")
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(.red.opacity(0.7))
                                .cornerRadius(20)
                        }
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
                    Button(action: {
                        checkSmallWinner()
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
                    Button(action: {
                        checkBigWinner()
                    }){
                        Text("Big Spin")
                            .padding(.horizontal,50)
                            .padding(.vertical,10)
                            .background(.green)
                            .font(.headline)
                            .foregroundColor(.black)
                            .cornerRadius(20)
                    }
                    Spacer()
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
