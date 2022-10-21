//
//  Tela7.swift
//  BuZ
//
//  Created by Joana Lopes on 06/10/22.
//

import SwiftUI

struct Tela7: View {
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
                
                Text("O **107** acabou de passar\nVocê conseguiu embarcar?")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                
                Button {
                    print("ola gabriel")
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

struct Tela7_Previews: PreviewProvider {
    static var previews: some View {
        Tela7()
    }
}

