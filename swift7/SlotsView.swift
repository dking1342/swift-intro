//
//  SlotsView.swift
//  swift7
//
//  Created by David King on 6/30/22.
//

import SwiftUI

struct SlotsView: View {
    @Binding var symbol:String
    @Binding var bgColor: Color
    var transition = AnyTransition.move(edge: .top).animation(.linear)

    var body: some View {
        VStack{
            if symbol == "🍒" {
                Text(symbol)
                    .transition(transition)
            }
            if symbol == "⭐️" {
                Text(symbol)
                    .transition(transition)
            }
            if symbol == "🍉" {
                Text(symbol)
                    .transition(transition)
            }
            if symbol == "🍊" {
                Text(symbol)
                    .transition(transition)
            }
            if symbol == "🍋" {
                Text(symbol)
                    .transition(transition)
            }
            if symbol == "💰" {
                Text(symbol)
                    .transition(transition)
            }
            if symbol == "💎" {
                Text(symbol)
                    .transition(transition)
            }
            if symbol == "🎰" {
                Text(symbol)
                    .transition(transition)
            }
        }
        .padding(.all,10)
        .background(bgColor.opacity(0.5))
        .font(.custom("Slot",fixedSize: 80))
        .cornerRadius(10)

    }
}

struct SlotsView_Previews: PreviewProvider {
    static var previews: some View {
        SlotsView(symbol:Binding.constant("🍒"),bgColor: Binding.constant(Color.blue))
    }
}
