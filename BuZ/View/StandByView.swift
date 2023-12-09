//
//  Tela5.swift
//  BuZ
//
//  Created by Joana Lopes on 06/10/22.
//

import SwiftUI

///This view is presented when the user is waiting for the bus to arrive.
///The view presents the bus's line and ETA in minutes and seconds.
struct StandByView: View {
    
    @StateObject var vm = BusLocationVM()
    
    let backgroundImageName: String = "AguardeTrace"
    
    var body: some View {
        waitingView
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton())
            .fullScreenCover(isPresented: $vm.busIsArriving) {
                WarningNextBus()
            }
    }
    
    var waitingView: some View {
        VStack {
            Spacer()
            standByText
            Spacer()
        }
        .background {
            background
        }
    }
    
    var background: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Image(backgroundImageName)
                .resizable()
                .scaledToFill()
        }
    }
    
    var standByText: some View {
        Text("Aguarde o \(vm.trackedLine).\n Ele chegará em \(vm.shortestETA)")
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .font(.custom("Sylexiad", size: 30))
            .lineSpacing(10)
            .multilineTextAlignment(.center)
            .padding(.bottom, 110)
    }
}

struct Aguarde_Previews: PreviewProvider {
    static var previews: some View {
        StandByView()
    }
}

