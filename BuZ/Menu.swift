//
//  ContentView.swift
//  BuZ
//
//  Created by Joana Lopes on 05/10/22.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        NavigationView {
             ZStack {
                 Color.black .ignoresSafeArea()
                 VStack {
                     
                     Text("BuZ")
                         .font(.largeTitle)
                         .foregroundColor(.blue)
                     
                     NavigationLink {
                         PraOndeVcVai()
                     } label: {
                         Text("Buscar Destino" as String)
                             .font(.title)
                             .frame(width: 280, height: 70)
                             .accessibilityAddTraits(.isButton)
                     }.buttonStyle(.borderedProminent)
                         .foregroundColor(.white)
                         .tint(Color.gray)
                 
                   NavigationLink {
                       BuscaOnibus()
                    } label: {
                        Text("Buscar Ônibus")
                            .font(.title)
                            .frame(width: 280, height: 70)
                    }.buttonStyle(.borderedProminent)
                        .foregroundColor(.white)
                        .tint(Color.gray)
                    
                    Button {
                        print("ola leila")
                    } label: {
                        Text("Favoritos")
                            .font(.title)
                            .frame(width: 280, height: 70)
                    }.buttonStyle(.borderedProminent)
                        .foregroundColor(.white)
                        .tint(Color.gray)
                    
                    Button {
                        print("ola leila")
                    } label: {
                        Text("Configurações")
                            .font(.title)
                            .frame(width: 280, height: 70)
                    }.buttonStyle(.borderedProminent)
                        .foregroundColor(.white)
                        .tint(Color.gray)
                }.padding()
            }
             
            
        }.ignoresSafeArea()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
