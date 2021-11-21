//
//  GuidedMeditationView.swift
//  MeteorStorm
//
//  Created by Fabiana Ferrara on 17/11/21.
//

import Foundation
import SwiftUI


struct GuidedMeditation: View {
    @Binding var rootIsActive : Bool
    @Binding var isCompleted : Bool
    
          var body: some View {
                    VStack{
                              Spacer()
                              Image(systemName: "aqi.medium")
                                        .resizable(resizingMode: .tile)
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(Color(.systemIndigo))
                                        .frame(width: 123, height: 86)
                              
                              
                              
                              Text("Sit on a chair that supports your back or lay\non a yoga  mat on the floor.")
                              
                                        .padding(.vertical)
                              
                        Text("Empty your mind and let the instructions     guide you.")
                            .padding()
                           
                              
                              Spacer()
                              
                              Text("Ready?").font(.largeTitle).fontWeight(.bold).padding()
                              
                              NavigationLink(destination: TextMed(rootIsActive: self.$rootIsActive, isCompleted: self.$isCompleted)) {
                                        Text("Start")
                                                  .padding(.vertical)
                                                  .frame( maxWidth: .infinity)
                                                  .foregroundColor(Color.white)
                                                  .background(Color(.systemIndigo)).cornerRadius(14)
                                                  .padding(.horizontal)
                              }
                              .isDetailLink(false)

                              
                    }//VStack
                    .navigationTitle("Guided Meditation")
                    .padding(.bottom)
                    .toolbar{
                              
                              Button{
                                   self.rootIsActive = false                                } label: {
                                        Text("Cancel")
                                                  .foregroundColor(Color(.systemIndigo))
                              }
                              
                    }//Toolbar
          }
}


