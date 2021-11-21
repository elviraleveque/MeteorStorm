//
//  TrafficLight.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 17/11/21.
//

import SwiftUI

struct TrafficLight: View {
    @Binding var rootIsActive : Bool
    @Binding var isCompleted : Bool
    
    
    
    var body: some View {
        
        VStack{
            Spacer()
            Image("traffic Light")
                .resizable(resizingMode: .tile)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color(.systemIndigo))
                .frame(width: 123, height: 86)
            
            VStack(alignment: .leading){
                
                Text("Try to pull yourself together by following the traffic light of your mindfulness.")
                    .padding(.horizontal)
                    .padding(.top)
                
                Text("Red light:\nStop for some time and think about the provided topic")
                    .padding(.horizontal)
                    .padding(.top)
                
                Text("Yellow light:\nType down a set of emotions before the timer expires")
                    .padding(.horizontal)
                    .padding(.top)
                
                Text("Green light:\nType down your thoughts on your set of emotions before the timer expires")
                    .padding(.horizontal)
                    .padding(.top)
            }
            
            Spacer()
            
            Text("Ready?").font(.largeTitle).fontWeight(.bold).padding()
            
            NavigationLink(destination: TrafficLight2(rootIsActive: self.$rootIsActive, isCompleted: self.$isCompleted)) {
                Text("Start")
                    .padding(.vertical)
                    .frame( maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color(.systemIndigo)).cornerRadius(14)
                    .padding(.horizontal)
            }
            .isDetailLink(false)
            
        }//VStack
        .navigationTitle("Traffic Light")
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

struct TrafficLight_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TrafficLight(rootIsActive: .constant(false), isCompleted: .constant(false))
                .preferredColorScheme(.light)
        }
    }
}
