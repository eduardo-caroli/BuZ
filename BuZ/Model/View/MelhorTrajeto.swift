//
//  Tela 3.swift
//  BuZ
//
//  Created by Joana Lopes on 06/10/22.
//

import SwiftUI

struct MelhorTrajeto: View {
    var body: some View {
            ZStack {
                Color.black .ignoresSafeArea()
                VStack {
//                    
//                    Button {
//                        print("ola gabriel")
//                    } label: {
//                        Text("Voltar")
//                            .font(.subheadline)
//                            .frame(width: 65, height: 40)
//                    }.buttonStyle(.borderedProminent)
//                        .foregroundColor(.white)
//                        .tint(Color.gray)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.top, 10)
//                        .padding(.leading, 10)
                    Spacer()
                    
                    NavigationLink {
                    Proximo()
                    } label: {
                        Text("Melhor Trajeto")
                            .font(.title)
                            .frame(width: 280, height: 70)
                    }.buttonStyle(.borderedProminent)
                        .foregroundColor(.white)
                        .tint(Color.gray)
                    
                    
                    NavigationLink {
                    TodasAsOpcoes()
                    } label: {
                        Text("Todas as Opções")
                            .font(.title)
                            .frame(width: 280, height: 70)
                    }.buttonStyle(.borderedProminent)
                        .foregroundColor(.white)
                        .tint(Color.gray)
                        .padding(.top)
                    Spacer()
                }
            }
        
    }

}

struct Tela_3_Previews: PreviewProvider {
    static var previews: some View {
        MelhorTrajeto()
    }
}
