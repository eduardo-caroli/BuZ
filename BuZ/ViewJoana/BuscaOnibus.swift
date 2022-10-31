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
    @State var busIsValid: Bool = true
    
    var validator = Validator()
    @State var nomeDaImagem2: String = "IconeSemFundo"
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    
                  
                    
//                    Text("BuZ")
//                        .font(.custom("Gill Sans SemiBold", size: 90))
//                        .foregroundColor(Color(red: 181/255, green: 215/255, blue: 255/255))
//                        .padding(.bottom, UIScreen.main.bounds.height / 10)
                    Image(nomeDaImagem2)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 130)
                      //  .aspectRatio(1, contentMode: .fit)
                        .clipped()
                        .accessibilityHidden(false)
                        .accessibilityLabel("Buz")
                        .padding(.bottom, 60)
                    
                    Text("Qual o seu ônibus?")
                        .font(.custom("Sylexiad", size: 30))
                        .foregroundColor(.white)
                    //                    .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 25)
                        .accessibilityHidden(true)
                    
                    
                    NavigationLink(destination: ConfirmarOnibus(), isActive: $didPressEnter) {
                        EmptyView()
                        
                    }
                    
                    TextField ("Qual o seu ônibus?", text: $buscar )
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
                        if (validator.checkLineExistence(of: buscar)) {
                            busLocationDAO.line = buscar
                            busIsValid = true
                            didPressEnter = true
                        } else {
                            busIsValid = false
                        }
                    }
                    .padding(.bottom, 300)
                    if(!busIsValid){
                        Text("O ônibus \(buscar) não foi encontrado.")
                        .tint(.white)
                        .foregroundColor(.white)
                    }
                    
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
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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
