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
    @EnvironmentObject var busLocationDAO: BusLocationDAO
    @StateObject var hapticsHandler = HapticsHandler()
    @State var scale = 1.0
    
    var TraceImg6: String = "Tela6Trace"
    
    var body: some View {
        ZStack {
            Color.black .ignoresSafeArea()
            imgTrace
            circle1
            circle2
            circle3
            nextBusTxt.onAppear{
                hapticsHandler.tocar()
            }
        }
    }
    var imgTrace: some View {
        Image(TraceImg6)
            .resizable()
            .scaledToFill()
    }
    var circle1: some View {
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
    }
    var circle2: some View {
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
    }
    var circle3: some View {
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
    }
    var nextBusTxt: some View{
        Text ("Fique atento!\n O próximo ônibus\n é o \(busLocationDAO.line)")
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .font(.custom("Sylexiad", size: 30))
            .lineSpacing(10)
            .padding(.bottom,50)
    }
    
}

