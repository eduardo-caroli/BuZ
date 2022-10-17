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
                .foregroundColor(Color.black)
                .padding(30)
            Circle()
                .foregroundColor(.mint)
                .padding(45)
            Circle()
                .foregroundColor(.cyan)
                .padding(60)
            Text ("Fique atento!\n o próximo ônibus\n é o **107**")
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
