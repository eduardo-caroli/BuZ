//
//  Tela4.swift
//  BuZ
//
//  Created by Joana Lopes on 06/10/22.
//

import SwiftUI

struct Proximo: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
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
                
                Text("O ônibus mais próximo é o\n107\n Com ele você chegará ao seu destino em:\n 40min")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                NavigationLink{
                  Aguarde()
                } label: {
                    Text("Confirmar")
                        .font(.title)
                        .frame(width: 280, height: 70)
                }.buttonStyle(.borderedProminent)
                    .foregroundColor(.black)
                    .tint(Color.cyan)
                
                Button {
                    print("ola gabriel")
                } label: {
                    Text("Cancelar")
                        .font(.title)
                        .frame(width: 280, height: 70)
                }.buttonStyle(.borderedProminent)
                    .foregroundColor(.white)
                    .tint(Color.gray)
                Spacer()
            }
        }
    }
}

struct Proximo_Previews: PreviewProvider {
    static var previews: some View {
        Proximo()
    }
}
