//
//  ContentView.swift
//  swift2
//
//  Created by David King on 6/22/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack{
//            Text("hello")
//            Image("slack-logo-icon")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//            Text("under the sea")
//        }
//        HStack{
//            Text("horizontal")
//            Text("stack")
//        }
//        ZStack{
//            Image("slack-logo-icon")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//            HStack(spacing: 40.0){
//                Text("slack")
//                Text("app")
//            }
//        }
        VStack{
            Spacer()
            Image("slack-logo-icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            HStack{
                Spacer()
                Text("slack")
                Text("app")
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
