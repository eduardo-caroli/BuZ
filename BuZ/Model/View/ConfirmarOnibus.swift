//
//  ConfirmarOnibus.swift
//  BuZ
//
//  Created by Joana Lopes on 07/10/22.
//

import SwiftUI


struct ConfirmarOnibus: View {
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
                
                Text("O 107\n Chegará no ponto da UFRJ em:\n 5min")
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
                
                NavigationLink{
                    Menu()
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

struct ConfirmarOnibus_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmarOnibus()
    }
}
