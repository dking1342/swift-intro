//
//  ContentView.swift
//  swift6
//
//  Created by David King on 6/29/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            Spacer()
            VStack{
                Spacer()
                Image(systemName: "star")
                    .imageScale(.large)
                    .font(.largeTitle)
                    .foregroundColor(.green)
                Spacer()
                Image(systemName: "star")
                    .imageScale(.large)
                    .font(.largeTitle)
                    .foregroundColor(.yellow)
                Spacer()
                Image(systemName: "star")
                    .imageScale(.large)
                    .font(.largeTitle)
                    .foregroundColor(.red)
                Spacer()

            }
            Spacer()
            VStack{
                Spacer()
                Image(systemName: "star")
                    .imageScale(.large)
                    .font(.largeTitle)
                    .foregroundColor(.green)
                Spacer()
                Image(systemName: "star")
                    .imageScale(.large)
                    .font(.largeTitle)
                    .foregroundColor(.yellow)
                Spacer()
                Image(systemName: "star")
                    .imageScale(.large)
                    .font(.largeTitle)
                    .foregroundColor(.red)
                Spacer()

            }
            Spacer()
            VStack{
                Spacer()
                Image(systemName: "star")
                    .imageScale(.large)
                    .font(.largeTitle)
                    .foregroundColor(.green)
                Spacer()
                Image(systemName: "star")
                    .imageScale(.large)
                    .font(.largeTitle)
                    .foregroundColor(.yellow)
                Spacer()
                Image(systemName: "star")
                    .imageScale(.large)
                    .font(.largeTitle)
                    .foregroundColor(.red)
                Spacer()

            }
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
