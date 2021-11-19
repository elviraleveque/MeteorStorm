//
//  GuidedMeditationView.swift
//  MeteorStorm
//
//  Created by Fabiana Ferrara on 17/11/21.
//

import Foundation
import SwiftUI


struct GuidedMeditation: View {
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
                              
                              NavigationLink(destination: TextMed()) {
                                        Text("Start")
                                                  .padding(.vertical)
                                                  .frame( maxWidth: .infinity)
                                                  .foregroundColor(Color.white)
                                                  .background(Color(.systemIndigo)).cornerRadius(14)
                                                  .padding(.horizontal)
                              }
                              
                    }//VStack
                    .navigationTitle("Breathing")
                    .padding(.bottom)
                    
                    .toolbar{
                              
                              Button{
                                        //Place the action that the button performs
                              } label: {
                                        Image(systemName: "gearshape")
                                                  .foregroundColor(Color(.systemIndigo))
                              }
                              
                    }//Toolbar
          }
}

struct GuidedMeditation_Previews: PreviewProvider {
          static var previews: some View {
                    Group {
                              GuidedMeditation()
                                        .preferredColorScheme(.light)
                              GuidedMeditation()
                                        .preferredColorScheme(.dark)
                    }
          }
}

