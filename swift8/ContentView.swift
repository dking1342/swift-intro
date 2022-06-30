//
//  ContentView.swift
//  swift8
//
//  Created by David King on 6/30/22.
//

import SwiftUI

struct ContentView: View {
    @State private var red:Double = 0
    @State private var green:Double = 0
    @State private var blue:Double = 0

    var body: some View {
        VStack{
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color(red:red/255,green:green/255,blue:blue/255))
                .border(Color.black,width: 1)
            
            SliderView(value:$red,label: "Red")
            SliderView(value:$green,label: "Green")
            SliderView(value:$blue,label: "Blue")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
