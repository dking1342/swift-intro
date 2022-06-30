//
//  ContentView.swift
//  swift6
//
//  Created by David King on 6/29/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isLiked = false
    @State private var numHearts = 0
    
    func handleTouch(){
        isLiked.toggle()
        if isLiked{
            numHearts += 1
        } else {
            numHearts -= 1
        }
    }
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.black,.gray], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            Image("avocado")
                .resizable()
                .ignoresSafeArea(.all)
                .aspectRatio(contentMode: .fill)
                .foregroundStyle(
                    .linearGradient(colors:[.red,.black], startPoint: .top, endPoint: .bottom)
                )
                .opacity(0.5)

            VStack{
                VStack{
                    HStack(alignment: .center, spacing: 200){
                        VStack{
                            Text("Hardcore")
                                .fontWeight(.bold)
                                .padding(.bottom,1)
                            Text("Avo Toast")
                                .fontWeight(.bold)
                        }
                        .font(.title2)
                        .foregroundColor(.white)
                        
                        VStack{
                            Button(action:{
                                handleTouch()
                            }) {
                                if isLiked {
                                    Image(systemName: "heart.fill")
                                        .imageScale(.large)
                                        .font(.largeTitle)
                                        .foregroundColor(.red)
                                    
                                } else {
                                    Image(systemName: "heart")
                                        .imageScale(.large)
                                        .font(.largeTitle)
                                        .foregroundColor(.red)
                                    
                                }
                            }
                            HStack{
                                Text("Likes: ")
                                Text(String(numHearts))
                            }
                            .foregroundColor(.white)
                        }
                        
                    }
                }
                Spacer()
                Text("Energize with this health and hearty breakfast")
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.bold)
            }.padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
