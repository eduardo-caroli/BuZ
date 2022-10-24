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
    @State var nomeDaImagem: String = "BuscaTrace"
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    
                    Text("BuZ")
                        .font(.custom("Gill Sans SemiBold", size: 90))
                        .foregroundColor(Color(red: 181/255, green: 215/255, blue: 255/255))
                        .padding(.bottom, UIScreen.main.bounds.height / 10)
                    
                    
                    Text("Qual o seu ônibus?")
                        .font(.custom("Sylexiad", size: 30))
                        .foregroundColor(.white)
                    //                    .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 25)
                    
                    
                    NavigationLink(destination: ConfirmarOnibus(), isActive: $didPressEnter) {
                        EmptyView()
                        
                    }
                    
                    TextField ("Buscar...", text: $buscar )
                    .font(.title2)
                    .textFieldStyle(.plain)
                    .tint(.white)
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .padding(.horizontal, 10)
                    .background((Color(red: 28/255, green: 28/255, blue: 28/255)), in: RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 40)
                    .onSubmit {
                        // updates `didPressEnter` to present next view
                        busLocationDAO.line = buscar
                        didPressEnter = true
                    }
                    .padding(.bottom, 300)
                    
                }
//                .frame(height: UIScreen.main.bounds.height)
//                .padding(.bottom, UIScreen.main.bounds.height * 0.35)
                .background {
                    Image(nomeDaImagem)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .accessibilityHidden(true)
                }
                
                
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            
            
        }
        .ignoresSafeArea(.keyboard, edges: .all)
    }
}

struct Tela_6_Previews: PreviewProvider {
    static var previews: some View {
        BuscaOnibus()
    }
}
