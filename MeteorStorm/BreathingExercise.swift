//
//  BreathingExercise.swift
//  MeteorStorm
//
//  Created by Fabiana Ferrara on 16/11/21.
//

import Foundation
import SwiftUI

struct BreathingExercise: View {
          @State var isVisible = false
          @State var currentDate = Date()
          @State var isActive = true
          
          var body: some View{
                    NavigationView{
                              VStack{
                                        TextSwitch()
                                        Spacer()
                                        Spacer()
                                        ZStack {
                                                  Image("MovingCircle")
                                                            .scaleEffect(isVisible ? 1.0 : 1.9)
                                                            .onAppear(perform: {
                                                                      if(isActive) { withAnimation(.easeInOut(duration: 4).repeatCount(16, autoreverses: true))
                                                                                {
                                                                                          self.isVisible.toggle()
                                                                                }
                                                                      }
                                                            })//onAppear
                                                  
                                                  Image("StaticCircle")
                                        } //ZStack
                                        Spacer()
                                        Spacer()
                                        CountDown(isActive: $isActive)
                                        Spacer()
                                        
                              }//VStack
                    }.navigationTitle("Breathing")
          }
}//view with the real exercise
