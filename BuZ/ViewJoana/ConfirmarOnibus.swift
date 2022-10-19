//
//  ConfirmarOnibus.swift
//  BuZ
//
//  Created by Joana Lopes on 07/10/22.
//

import SwiftUI


struct ConfirmarOnibus: View {
    
    @EnvironmentObject var busLocationDAO: BusLocationDAO
    var busLine:String {busLocationDAO.line}
    var busATA:String { "1000 min" }

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Spacer()

                Text("O \(busLine) chegará em \(busATA)")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(. top, 150)
                    .multilineTextAlignment(.center)
                    .accessibilitySortPriority(-Double.infinity)


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
                    .accessibilitySortPriority(3)
                Spacer()
            }.accessibilitySortPriority(2)
        }
    }
}

struct ConfirmarOnibus_Previews: PreviewProvider {
    @EnvironmentObject var busLocationDAO: BusLocationDAO
    static var previews: some View {
        ConfirmarOnibus()
    }
}
