//
//  SlotRowView.swift
//  swift7
//
//  Created by David King on 6/30/22.
//

import SwiftUI

struct SlotRowView: View {
    
    @Binding var symbols:[String]
    @Binding var slotsArray:[Int]
    @Binding var color:[Color]
    
    var body: some View {
        HStack{
            SlotsView(
                symbol:$symbols[slotsArray[0]],
                bgColor: $color[0]
            )
            SlotsView(
                symbol:$symbols[slotsArray[1]],
                bgColor: $color[1]
            )
            SlotsView(
                symbol:$symbols[slotsArray[2]],
                bgColor: $color[2]
            )
        }
    }
}

struct SlotRowView_Previews: PreviewProvider {
    static var previews: some View {
        SlotRowView(
            symbols: Binding.constant(["🍒","⭐️","🍉"]),
            slotsArray: Binding<[Int]>.constant([0,1,2]),
            color:Binding.constant([Color.white,Color.white,Color.white])
        )
    }
}
