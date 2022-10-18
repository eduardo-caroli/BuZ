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
                
                Text("O \(busLocationDAO.line) chegará em \(busLocationDAO.closestBus!.ordem)")
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
