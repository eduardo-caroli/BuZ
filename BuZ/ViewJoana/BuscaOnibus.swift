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

        GeometryReader { geometry in
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    
                    Text("BuZ")
                        .font(.custom("Gill Sans SemiBold", size: 100))
                        .foregroundColor(Color(red: 181/255, green: 215/255, blue: 255/255))
                        .padding(.bottom, geometry.size.height / 7)
                 
                 
                    Text("Qual o seu ônibus?")
                        .font(.custom("Sylexiad", size: 30))
                        .foregroundColor(.white)
                    //                    .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 25)


                    NavigationLink(destination: ConfirmarOnibus(), isActive: $didPressEnter) {
                        EmptyView()

                    }

                    TextField ("Buscar...",text: $buscar ) .onSubmit {
                        // updates `didPressEnter` to present next view

                        busLocationDAO.line = buscar
                        didPressEnter = true

                    }
                    .font(.title2)
                    .foregroundColor(.white)
                    .tint(Color.white)
                    .frame(width: 300, height: 50, alignment: .leading)
                    .padding(.leading, 20)
                    .textFieldStyle(.plain)
                    .background(Color(red: 28/255, green: 28/255, blue: 28/255))
                    .cornerRadius(10)
                    
                }
                .padding(.bottom, geometry.size.height * 0.25)

            }
            
        }.navigationBarHidden(true)
    }
}
struct Tela_6_Previews: PreviewProvider {
    static var previews: some View {
        BuscaOnibus()
    }
}

 
