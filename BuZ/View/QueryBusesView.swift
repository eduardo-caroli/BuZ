//
//  Tela 6.swift
//  BuZ
//
//  Created by Joana Lopes on 06/10/22.
//
import SwiftUI
import AVFoundation

struct QueryBusesView: View {
    @EnvironmentObject var vm: BusLocationVM
    @State var queriedLine: String = ""
    @State var didPressEnter: Bool = false
    @State var queriedLineNotFound: Bool = false
    let backgroundImageName: String = "BuscaTrace"
    let logoImageName: String = "Buz"
    let textfieldPlaceholder: String = "Qual o seu ônibus?"
    
    func onSubmitAction() {
        do {
            try vm.setTrackedLine(to: queriedLine)
            queriedLineNotFound = false
            didPressEnter = true
        } catch {
            queriedLineNotFound = true
            queriedLine = ""
            textfieldPlaceholder.speak()
        }
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                VStack {
                    logoImage
                    queryTitle
                    queryTextField
                        .onSubmit {
                            onSubmitAction()
                        }
                    queriedLineNotFoundWarning
                    
                }
                .padding(.bottom, 300)
                .background {
                    background
                }
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
                NavigationLink(destination: ConfirmView(), isActive: $didPressEnter) {
                    EmptyView()
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .ignoresSafeArea(.keyboard, edges: .all)
    }
    
    @ViewBuilder
    var queriedLineNotFoundWarning: some View {
            Text("A linha \(queriedLine) não foi encontrada")
                .foregroundStyle(.red)
                .opacity(queriedLineNotFound ? 1.0 : 0.0)
    }
    var logoImage: some View {
        Image(logoImageName)
            .resizable()
            .scaledToFit()
            .frame(height: 75)
            .clipped()
            .accessibilityHidden(false)
            .accessibilityLabel("Buz")
            .padding(.bottom, 60)
    }
    var queryTitle: some View {
        Text("Qual o seu ônibus?")
            .font(.custom("Sylexiad", size: 30))
            .foregroundColor(.white)
            .padding(.bottom, 25)
            .accessibilityHidden(true)
    }
    var queryTextField: some View {
        TextField (textfieldPlaceholder, text: $queriedLine )
            .font(.title2)
            .submitLabel(.search)
            .textFieldStyle(.plain)
            .tint(.white)
            .foregroundColor(.white)
            .frame(height: 50)
            .padding(.horizontal, 10)
            .background((Color(red: 28/255, green: 28/255, blue: 28/255)), in: RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 40)
            .padding(.bottom)
    }
    var background: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Image(backgroundImageName)
                .resizable()
                .scaledToFill()
                .clipped()
                .accessibilityHidden(true)
        }
    }
    
}

struct Tela_6_Previews: PreviewProvider {
    static var previews: some View {
        QueryBusesView()
    }
}
