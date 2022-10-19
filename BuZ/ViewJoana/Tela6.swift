//
//  Tela6.swift
//  BuZ
//
//  Created by Joana Lopes on 06/10/22.
//

import SwiftUI
import AudioToolbox

struct Tela6: View {
    var busNumber:Int = 107
    var mainText:String {"Fique atento!\n O próximo ônibus\n é o **\(busNumber)**"}
    
    
    var body: some View {
        ZStack {
            Color.black .ignoresSafeArea()
            Circle()
                .foregroundColor(Color(red: 181/255, green: 215/255, blue: 255/255, opacity: 80/100))
                .padding(30)
                .padding(.bottom,50)
            Circle()
                .foregroundColor(Color(red: 181/255, green: 215/255, blue: 255/255, opacity: 68/100))
                .padding(45)
                .padding(.bottom,50)
            Circle()
                .foregroundColor(Color(red: 181/255, green: 215/255, blue: 255/255))
                .padding(60)
                .padding(.bottom,50)
            Text (mainText)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .font(.largeTitle)
                .lineSpacing(10)
                .padding(.bottom,50)
        }
        .onTapGesture { print(mainText) }
        .onAppear{
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
}

struct Tela6_Previews: PreviewProvider {
    static var previews: some View {
        Tela6()
    }
}
