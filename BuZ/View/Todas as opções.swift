//
//  Todas as opções.swift
//  BuZ
//
//  Created by Joana Lopes on 07/10/22.
//

import SwiftUI

struct TodasAsOpcoes: View {
    var body: some View {
                NavigationView {
                     ZStack {
                         Color.black .ignoresSafeArea()
                         VStack {
                             
        
                             NavigationLink {
                                 ConfirmView()
                             } label: {
                                 Text("**107**        Sai em 5min\n          De: UFRJ - Praia Vermelha\n Chega em seu destino: 15:15h")
                                     .font(.title2)
                                     .frame(width: 500, height: 100)
                             }.buttonStyle(.borderedProminent)
                                 .foregroundColor(.white)
                                 .tint(Color.gray)
                         
                           NavigationLink {
                               ConfirmView()
                            } label: {
                                Text("**107**        Sai em 5min\n          De: UFRJ - Praia Vermelha\n Chega em seu destino: 15:15h")
                                    .font(.title2)
                                    .frame(width: 500, height: 100)
                            }.buttonStyle(.borderedProminent)
                                .foregroundColor(.white)
                                .tint(Color.gray)
                            
                             NavigationLink {
                                ConfirmView()
                            } label: {
                                Text("**107**        Sai em 5min\n          De: UFRJ - Praia Vermelha\n Chega em seu destino: 15:15h")
                                    .font(.title2)
                                    .frame(width: 500, height: 100)
                            }.buttonStyle(.borderedProminent)
                                .foregroundColor(.white)
                                .tint(Color.gray)
                            
                             NavigationLink {
                                 ConfirmView()
                            } label: {
                                Text("**107**        Sai em 5min\n          De: UFRJ - Praia Vermelha\n Chega em seu destino: 15:15h")
                                    .font(.title2)
                                    .frame(width: 500, height: 100)
                            }.buttonStyle(.borderedProminent)
                                .foregroundColor(.white)
                                .tint(Color.gray)
                        }.padding()
                    }
                     
                    
                }.ignoresSafeArea()
                
            }
        }

        struct TodasAsOpcoes_Previews: PreviewProvider {
            static var previews: some View {
                TodasAsOpcoes()
            }
        }
