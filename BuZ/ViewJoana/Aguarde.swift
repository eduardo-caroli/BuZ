//
//  Tela5.swift
//  BuZ
//
//  Created by Joana Lopes on 06/10/22.
//

import SwiftUI

struct Aguarde: View {
    
    @EnvironmentObject var busLocationDAO: BusLocationDAO
    @State var isWaiting: Bool = true
    @State var nomeDaImagem: String = "AguardeTrace"
    
    var waitingView: some View {
        ZStack {
            Color.black .ignoresSafeArea()
            
            Image(nomeDaImagem)
                .resizable()
                .scaledToFill()
            
            VStack {
                Spacer()
                
                Text("Aguarde o \(busLocationDAO.line).\n Ele chegará em \(busLocationDAO.closestBus.etaString ?? "Sem ETA")")
                /*
                Podemos usar o force unwrap em closestBus porque, se o usuário chegou nessa tela, já selecionou uma linha de ônibus válida.
                 */
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.custom("Sylexiad", size: 30))
                    .lineSpacing(10)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 110)
                Spacer()
            }
        }
    }
    
    var body: some View {
        Group {
            if isWaiting {
                waitingView
                    .onAppear {
                        wait(seconds: 5)
                    }
            } else {
                Tela6()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
        
        
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

