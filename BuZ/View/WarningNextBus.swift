//
//  Tela6.swift
//  BuZ
//
//  Created by Joana Lopes on 06/10/22.
//

import SwiftUI
import AudioToolbox
import CoreHaptics


struct WarningNextBus: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var busLocationVM: BusLocationVM
    @State var nomeDaImagem: String = "Tela6Trace"
    @StateObject var hapticsHandler = HapticsHandler()

    @State var scale = 1.0
    var body: some View {
        ZStack {
            Color.black .ignoresSafeArea()

            Image(nomeDaImagem)
                .resizable()
                .scaledToFill()

            Circle()
                .foregroundColor(Color(red: 181/255, green: 215/255, blue: 255/255, opacity: 80/100))
                .padding(30)
                .padding(.bottom,50)
                .scaleEffect(scale)
                .onAppear {
                    let base = Animation.easeInOut(duration: 1.2)
                    let repeated = base.repeatForever(autoreverses: true)
                    withAnimation(repeated) {
                        scale = 1.1
                    }
                }
            Circle()
                .foregroundColor(Color(red: 181/255, green: 215/255, blue: 255/255, opacity: 68/100))
                .padding(45)
                .padding(.bottom,50)
                .scaleEffect(scale)
                .onAppear {
                    let base = Animation.easeInOut(duration: 1.2)
                    let repeated = base.repeatForever(autoreverses: true)
                    withAnimation(repeated) {
                        scale = 1.1
                    }
                }
            
            Circle()
                .foregroundColor(Color(red: 181/255, green: 215/255, blue: 255/255))
                .padding(60)
                .padding(.bottom,50)
                .scaleEffect(scale)
                .onAppear {
                    let base = Animation.easeInOut(duration: 1.1)
                    let repeated = base.repeatForever(autoreverses: true)
                    withAnimation(repeated) {
                        scale = 1.1
                    }
                }
            
            Text ("Fique atento!\n O próximo ônibus\n é o \(busLocationVM.trackedLine)")
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .font(.custom("Sylexiad", size: 30))
                .lineSpacing(10)
                .padding(.bottom,50)
        }.onAppear{
            hapticsHandler.tocar()
            
        }
    }
}

struct Tela6_Previews: PreviewProvider {
    static var previews: some View {
        WarningNextBus()
    }
}
