//
//  Tela 6.swift
//  BuZ
//
//  Created by Joana Lopes on 06/10/22.
//

import SwiftUI

struct BuscaOnibus: View {
    @EnvironmentObject var busLocationDAO: BusLocationDAO
    @State var buscar:String = ""
    @State var didPressEnter: Bool = false
    var body: some View {
        ZStack {
            Color.black .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Qual o seu ônibus?")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.leading, 10)

                NavigationLink(destination: ConfirmarOnibus(), isActive: $didPressEnter) {
                    EmptyView()
                }
                
                TextField ("Buscar...",text: $buscar) .onSubmit {
                    // updates `didPressEnter` to present next view
                    busLocationDAO.line = buscar
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

 
