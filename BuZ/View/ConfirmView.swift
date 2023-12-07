//
//  ConfirmarOnibus.swift
//  BuZ
//
//  Created by Joana Lopes on 07/10/22.
//

import SwiftUI


struct ConfirmView: View {
    
    
    
    @EnvironmentObject var busLocationDAO: BusLocationDAO
    var busLine:String {busLocationDAO.line}
    var busETA: String {(busLocationDAO.closestBus.etaString)!}
    @State var confirmTraceImg: String = "ConfirmarTrace"
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            traceImage
            
            VStack {
                Spacer()
                etaBusLine
                
                NavigationLink{
                    WaitingBusView()
                } label: {
                    Text("Confirmar")
                        .font(.custom("Sylexiad", size: 30))
                        .frame(width: 280, height: 70)
                }.buttonStyle(.borderedProminent)
                    .foregroundColor (.black)
                    .tint(Color(red: 181/255, green: 215/255, blue: 255/255))
                
                
                NavigationLink{
                    SearchingForBusView()
                } label: {
                    Text("Cancelar")
                        .font(.custom("Sylexiad", size: 30))
                        .frame(width: 280, height: 70)
                }.buttonStyle(.borderedProminent)
                    .foregroundColor(.white)
                    .tint(Color(red: 28/255, green: 28/255, blue: 28/255))
                
                    .padding(.bottom, 170)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton())
            .accessibilitySortPriority(2)
        }
    }
    
    var traceImage: some View {
        Image(confirmTraceImg)
            .resizable()
            .scaledToFill()
            .accessibilityHidden(true)
    }
    var etaBusLine: some View {
        
        Text("O \(busLine) chegará em \(busLocationDAO.closestBus.etaString ?? "sem ETA")")
        
            .font(.custom("Sylexiad", size: 30))
            .foregroundColor(.white)
            .padding(.top, 180)
            .padding(.horizontal, 15)
            .multilineTextAlignment(.center)
            .padding(.bottom, 40)
            .background(.black.opacity(0.01))
            .accessibilityAddTraits(.isStaticText)
    }
    
    
}



struct BackButton: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
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
    }
}

struct ConfirmarOnibus_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView()
    }
}
