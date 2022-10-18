//
//  Tela 6.swift
//  BuZ
//
//  Created by Joana Lopes on 06/10/22.
//

import SwiftUI

struct BuscaOnibus: View {
    @StateObject var busLocationViewModel = BusLocationViewModel()
    @State var buscar:String = ""
    @State var didPressEnter: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black .ignoresSafeArea()
                VStack {
                    
                    Text("BuZ")
                        .font (.system(size: 80,weight: .bold, design: .rounded))
                        .foregroundColor(Color(red: 181/255, green: 215/255, blue: 255/255))
                        .padding (.bottom, 150)
                    
                    
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
                    
                    Text("Qual o seu ônibus?")
                        .font(.title)
                        .foregroundColor(.white)
                    //                    .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, geometry.size.height / 30)
                    
                    
                    NavigationLink(destination: ConfirmarOnibus(), isActive: $didPressEnter) {
                        EmptyView()
                        
                    }
                    
                    TextField ("Buscar...",text: $buscar) .onSubmit {
                        // updates `didPressEnter` to present next view
                        
                        busLocationViewModel.line = buscar
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
                    .padding(.bottom, geometry.size.height / 10)
                    Spacer()
                }
                .padding(.top, geometry.size.height / 10)
            }
            
        }
    }
}
struct Tela_6_Previews: PreviewProvider {
    static var previews: some View {
        BuscaOnibus()
    }
}
