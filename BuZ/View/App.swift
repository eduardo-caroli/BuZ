//
//  ContentView.swift
//  BuZ
//
//  Created by Joana Lopes on 05/10/22.
//

import SwiftUI

struct App: View {
    var body: some View {
        
             ZStack {
                 Color.black .ignoresSafeArea()
                 VStack {
                     
                     Text("BuZ")
                         .font(.largeTitle)
                         .foregroundColor(Color(red: 181/255, green: 215/255, blue: 255/255))
                     

                   NavigationLink {
                       SearchingForBusView()
                    } label: {
                        Text("Buscar Ônibus")
                            .font(.title)
                            .frame(width: 280, height: 70)
                    }.buttonStyle(.borderedProminent)
                        .foregroundColor(.white)
                        .tint(Color.gray)
                }.padding()
            
             
            
        }.ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        App()
    }
}
