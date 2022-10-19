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
                
                Text("O **107** \nChegará no ponto: \n UFRJ - Praia Vermelha \n Em: **5min**")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(. top, 150)
                    .multilineTextAlignment(.center)
                
                
                NavigationLink{
                    Aguarde()
                } label: {
                    Text("Confirmar")
                        .font(.title)
                        .frame(width: 280, height: 70)
                }.buttonStyle(.borderedProminent)
                    .foregroundColor(.black)
                    .tint(Color(red: 181/255, green: 215/255, blue: 255/255))
                 
                
                NavigationLink{
                    BuscaOnibus()
                } label: {
                    Text("Cancelar")
                        .font(.title)
                        .frame(width: 280, height: 70)
                }.buttonStyle(.borderedProminent)
                    .foregroundColor(.white)
                    .tint(Color(red: 28/255, green: 28/255, blue: 28/255))
                    .padding(.bottom, 170)
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
