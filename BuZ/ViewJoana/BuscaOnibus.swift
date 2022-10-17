//
//  Tela 6.swift
//  BuZ
//
//  Created by Joana Lopes on 06/10/22.
//

import SwiftUI

struct BuscaOnibus: View {
    @State var buscar:String = ""
    @State var didPressEnter: Bool = false
    var body: some View {
        ZStack {
            Color.black .ignoresSafeArea()
            VStack {
               
//                Button {
//                    print("ola gabriel")
//                } label: {
//                    Text("Voltar")
//                        .font(.subheadline)
//                        .frame(width: 65, height: 40)
//                }.buttonStyle(.borderedProminent)
//                    .foregroundColor(.white)
//                    .tint(Color.gray)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.top, 10)
//                    .padding(.leading, 10)
                Spacer()
                Text("Qual o seu ônibus?")
                    .font(.title)
                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)

                NavigationLink(destination: ConfirmarOnibus(), isActive: $didPressEnter) {
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
//                    ConfirmarOnibus()
//                } label: {
//                    Text("Buscar")
//                        .font(.subheadline)
//                        .frame(width: 300, height: 50, alignment: .leading)
//                        .padding(.leading, 10)
//
//
//                }.buttonStyle(.borderedProminent)
//                    .foregroundColor(.white)
//                    .tint(Color.gray)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.leading, 10)

                Spacer()
            }
        }
    }
}
struct Tela_6_Previews: PreviewProvider {
    static var previews: some View {
        BuscaOnibus()
    }
}
