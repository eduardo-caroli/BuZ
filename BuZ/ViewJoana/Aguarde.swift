//
//  Tela5.swift
//  BuZ
//
//  Created by Joana Lopes on 06/10/22.
//

import SwiftUI

struct Aguarde: View {
    @Environment(\.dismiss) private var dismiss

    @EnvironmentObject var busLocationDAO: BusLocationDAO
    @State var isWaiting: Bool = true
    
    var waitingView: some View {
        ZStack {
            Color.black .ignoresSafeArea()
            VStack {
                Spacer()
                
                Text("Aguarde o \(busLocationDAO.line).\nEle chegará em \(busLocationDAO.closestBus!.ordem)")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.custom("Sylexiad", size: 30))
                    .lineSpacing(10)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 110)
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
    
    var body: some View {
        if isWaiting {
            waitingView
                .onAppear {
                wait(seconds: 5)
            }
        } else {
            Tela6()
        }
        
        
    }
    
    func wait(seconds: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(seconds)) {
            print("joana")
            self.isWaiting = false
        }
    }
       
}
    
    struct Aguarde_Previews: PreviewProvider {
        static var previews: some View {
            Aguarde()
        }
    }

