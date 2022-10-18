//
//  Tela5.swift
//  BuZ
//
//  Created by Joana Lopes on 06/10/22.
//

import SwiftUI

struct Aguarde: View {
    
     
    @State var isWaiting: Bool = true
    
    var waitingView: some View {
        ZStack {
            Color.black .ignoresSafeArea()
            VStack {
                Spacer()
                
                Text("Aguarde o **107**\nEm: UFRJ - Praia Vermalha\nEle chegará em 5min")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.title)
                    .lineSpacing(10)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 110)
                Spacer()
            }
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

