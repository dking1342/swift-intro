//
//  ContentView.swift
//  swift3
//
//  Created by David King on 6/22/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
//            Image("background")
//                .ignoresSafeArea()
            VStack{
                Spacer()
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300.0, height: 70.0)
                Spacer()
                HStack{
                    Spacer()
                    Image("card2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:125.0, height:160.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .shadow(color: Color.black, radius: 10.0, x: 5.0, y: 6.0)
                    Spacer()
                    Image("card5")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:125.0, height:160.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .shadow(color: Color.black, radius: 10.0, x: 2.0, y: 2.0)

                    Spacer()
                }
                Spacer()
                Image("start")
                    .resizable(capInsets: EdgeInsets())
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0, height: 100.0)
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("player")
                            .font(.system(size:40.0))
                        Text("0")
                            .font(.system(size:60,weight: Font.Weight.thin))
                    }
                    Spacer()
                    VStack{
                        Text("cpu")
                            .font(.system(size:40.0))
                        Text("0")
                            .font(.system(size:60,weight: Font.Weight.thin))
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
