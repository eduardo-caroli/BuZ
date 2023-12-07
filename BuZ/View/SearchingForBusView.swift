//
//  Tela 6.swift
//  BuZ
//
//  Created by Joana Lopes on 06/10/22.
//
import SwiftUI
import AVFoundation

struct SearchingForBusView: View {
    @EnvironmentObject var busLocationDAO: BusLocationDAO
    @State var buscar:String = ""
    @State var didPressEnter: Bool = false
    @State var nomeDaImagem: String = "BuscaTrace"
    @State var busIsValid: Bool = true
    @State var textfieldPlaceholder: String = "Qual o seu ônibus?"
    var validator = Validator()
    @State var BuzLogo: String = "Buz"
   
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    Image(BuzLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 75)
                        .clipped()
                        .accessibilityHidden(false)
                        .accessibilityLabel("Buz")
                        .padding(.bottom, 60)
                    
                    Text("Qual o seu ônibus?")
                
                        .font(.custom("Sylexiad", size: 30))
                        .foregroundColor(.white)
                        .padding(.bottom, 25)
                        .accessibilityHidden(true)
                    
                    
                    NavigationLink(destination: ConfirmView(), isActive: $didPressEnter) {
                        EmptyView()
                        
                    }
                    

                    TextField (textfieldPlaceholder, text: $buscar )
                    .font(.title2)
                    .submitLabel(.search)
                    .textFieldStyle(.plain)
                    .tint(.white)
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .padding(.horizontal, 10)
                    .background((Color(red: 28/255, green: 28/255, blue: 28/255)), in: RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 40)
                    .onSubmit {
                        if (validator.checkLineExistence(of: buscar)) {
                            busLocationDAO.line = buscar
                            busIsValid = true
                            didPressEnter = true
                        } else {
                            busIsValid = false
                            textfieldPlaceholder = "O \(buscar) não foi encontrado."
                            buscar = ""
                            textfieldPlaceholder.speak()
                        }
                    }
                    .padding(.bottom, 300)
                }
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
        SearchingForBusView()
    }
}
