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
            
            Slider(value: $red, in: 0...255,step:1)
            Text("Red: \(Int(red))")
            Slider(value: $green, in: 0...255,step:1)
            Text("Green: \(Int(green))")
            Slider(value: $blue, in: 0...255,step:1)
            Text("Blue: \(Int(blue))")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
