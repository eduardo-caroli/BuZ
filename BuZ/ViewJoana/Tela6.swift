//
//  Tela6.swift
//  BuZ
//
//  Created by Joana Lopes on 06/10/22.
//

import SwiftUI
import AudioToolbox

struct Tela6: View {
    var body: some View {
        ZStack {
            Color.black .ignoresSafeArea()
            
            Circle()
                .foregroundColor(.blue)
                .padding(30)
            Circle()
                .foregroundColor(.mint)
                .padding(45)
            Circle()
                .foregroundColor(.cyan)
                .padding(60)
            Text ("Fique atento! \n O próximo ônibus é o **107**")
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .font(.largeTitle)
                .lineSpacing(10)
        }.onAppear{
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
}

struct Tela6_Previews: PreviewProvider {
    static var previews: some View {
        Tela6()
    }
}
