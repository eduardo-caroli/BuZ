//
//  ConfirmarOnibus.swift
//  BuZ
//
//  Created by Joana Lopes on 07/10/22.
//

import SwiftUI


struct ConfirmarOnibus: View {
    
    @EnvironmentObject var busLocationDAO: BusLocationDAO
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                Text("O \(busLocationDAO.line) chegará em \(busLocationDAO.closestBus.etaString ?? "sem ETA")")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(40)
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
                    .tint(Color.gray)
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
