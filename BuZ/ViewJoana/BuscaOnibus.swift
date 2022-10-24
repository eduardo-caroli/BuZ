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
        
       // GeometryReader { geometry in
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
                    
                    TextField ("Buscar...",text: $buscar ) .onSubmit {
                        // updates `didPressEnter` to present next view
                        
                        busLocationDAO.line = buscar
                        didPressEnter = true
                        
                    }
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.leading, 10)
                    .textFieldStyle(.plain)
                    .background(Color.gray)
                    .cornerRadius(20)
                }
//                .frame(height: UIScreen.main.bounds.height)
                .padding(.bottom, UIScreen.main.bounds.height * 0.35)
                .background {
                    Image(nomeDaImagem)
                        .resizable()
                        .scaledToFit()
                        .clipped()
                }
                
                
            }
            
  //      }
    }
}

struct Tela_6_Previews: PreviewProvider {
    static var previews: some View {
        BuscaOnibus()
    }
}
