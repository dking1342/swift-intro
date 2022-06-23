//
//  ContentView.swift
//  swift2
//
//  Created by David King on 6/22/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Text("Hello!!").padding().background(Color.blue)
        Text("Text here")
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(Color.green)
            .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
