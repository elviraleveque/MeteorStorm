//
//  TrafficLight.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 17/11/21.
//

import SwiftUI

struct TrafficLight: View {
          var body: some View {

                              VStack{
                                        Spacer()
                                        Image("traffic Light")
                                                  .resizable(resizingMode: .tile)
                                                  .aspectRatio(contentMode: .fit)
                                                  .foregroundColor(Color(.systemIndigo))
                                                  .frame(width: 123, height: 86)
                                        
                                        
                                        
                                        Text("\n\nTry to pull yourself together by following\n the traffic light of your mindfulness.")
                                        
                                      .padding(.vertical)
                                      .multilineTextAlignment(.center)
                                        
                                        Text("Red light:\n Stop for some time and think about\n the provided topic")
                                     
                                      .multilineTextAlignment(.center)
                                      .padding(.vertical)
                                  
                                  Text("Yellow light:\n Type down a set of emotions\n before the timer expires")
                               
                                .multilineTextAlignment(.center)
                                .padding(.vertical)
                                  
                                  Text("Green light:\nType down your thoughts on your set of emotions before the timer expires")
                               
                                .multilineTextAlignment(.center)
                                .padding(.vertical)
                                
                                        Spacer()
                                        
                                        Text("Ready?").font(.largeTitle).fontWeight(.bold).padding()
                                        
                                        NavigationLink(destination: TrafficLight2()) {
                                                  Text("Start")
                                                            .padding(.vertical)
                                                            .frame( maxWidth: .infinity)
                                                            .foregroundColor(Color.white)
                                                            .background(Color(.systemIndigo)).cornerRadius(14)
                                                            .padding(.horizontal)
                                        }
                                        
                              }//VStack
                              .navigationTitle("Relationship Caring")
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

struct TrafficLight_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLight()
    }
}
