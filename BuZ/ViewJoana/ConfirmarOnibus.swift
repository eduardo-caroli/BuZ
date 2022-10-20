//
//  ConfirmarOnibus.swift
//  BuZ
//
//  Created by Joana Lopes on 07/10/22.
//

import SwiftUI


struct ConfirmarOnibus: View {
    @Environment(\.dismiss) private var dismiss

    @EnvironmentObject var busLocationDAO: BusLocationDAO
    var busLine:String {busLocationDAO.line}
    var busATA:String { "1000 min" }

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Spacer()

                Text("\n\n\nO \(busLine) chegará em \(busATA)\n\n\n")
                    .font(.custom("Sylexiad", size: 30))
                    .foregroundColor(.white)
                    .padding(. top, 60)
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
                    .multilineTextAlignment(.center)
                    .accessibilitySortPriority(-Double.infinity)
                    .background {
                       
                    }


                NavigationLink{
                    Aguarde()
                } label: {
                    Text("Confirmar")
                        .font(.custom("Sylexiad", size: 30))
                        .frame(width: 280, height: 70)
                }.buttonStyle(.borderedProminent)
                    .foregroundColor(.black)
                    .tint(Color(red: 181/255, green: 215/255, blue: 255/255))


                NavigationLink{
                    BuscaOnibus()
                } label: {
                    Text("Cancelar")
                        .font(.custom("Sylexiad", size: 30))
                        .frame(width: 280, height: 70)
                }.buttonStyle(.borderedProminent)
                    .foregroundColor(.white)
                    .tint(Color(red: 28/255, green: 28/255, blue: 28/255))
                    .padding(.bottom, 180)
                    .accessibilitySortPriority(3)
                    .padding(5)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .tint(Color(red: 181/255, green: 215/255, blue: 255/255))
                        Text("Voltar")
                        .foregroundColor(Color(red: 181/255, green: 215/255, blue: 255/255))
                        .font(.custom("Helvetica", size: 20))
                    }.accessibilitySortPriority(-2)
                }
            )
            .accessibilitySortPriority(2)
            
        }
    }
}

struct ConfirmarOnibus_Previews: PreviewProvider {
    @EnvironmentObject var busLocationDAO: BusLocationDAO
    static var previews: some View {
        ConfirmarOnibus()
    }
}
