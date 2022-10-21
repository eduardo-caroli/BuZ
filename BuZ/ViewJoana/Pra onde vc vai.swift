//
//  Tela2.swift
//  BuZ
//
//  Created by Joana Lopes on 05/10/22.
//

import SwiftUI



struct PraOndeVcVai: View {
    @State var buscar:String = ""
    @State var didPressEnter: Bool = false
    var body: some View {
        ZStack {
            Color.black .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Pra onde você vai?")
                    .font(.title)
                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                
               
                NavigationLink(destination: MelhorTrajeto(), isActive: $didPressEnter) {
                    EmptyView()
                }
                
                TextField ("Buscar...",text: $buscar) .onSubmit {
                    // updates `didPressEnter` to present next view
                    didPressEnter = true
                }
                .font(.subheadline)
                .foregroundColor(.black)
                .tint(Color.black)
                .frame(width: 300, height: 50, alignment: .leading)
                .padding(.leading, 10)
                .padding(.leading, 10)
                .textFieldStyle(.plain)
                .background(Color.gray)
                .cornerRadius(20)
                
            
                
//                NavigationLink {
//                    MelhorTrajeto()
//                } label: {
//
//
//                    }
//
//
//
//                }.buttonStyle(.borderedProminent)
//                    .foregroundColor(.white)
//                    .tint(Color.gray)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.leading, 10)
//
                Spacer()
            }
        }
        
    }
    struct Tela2_Previews: PreviewProvider {
        static var previews: some View {
            PraOndeVcVai()
        }
    }
}
