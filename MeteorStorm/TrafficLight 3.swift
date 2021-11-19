//
//  TrafficLight3.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 18/11/21.
//

import SwiftUI

struct TrafficLight3: View {
    var body: some View {
        VStack{
            Spacer()
            Image("traffic Light")
                      .resizable(resizingMode: .tile)
                      .aspectRatio(contentMode: .fit)
                      .foregroundColor(Color(.systemIndigo))
                      .frame(width: 123, height: 86)
            
            
            
            Text("It seems you had problems")
            
          .padding(.vertical)
          .multilineTextAlignment(.center)
            
            Text("")
         
          .multilineTextAlignment(.center)
    
            Spacer()
            
            NavigationLink(destination: TrainingView()) {
                      Text("Done")
                                .padding(.vertical)
                                .frame( maxWidth: .infinity)
                                .foregroundColor(Color.white)
                                .background(Color(.systemIndigo)).cornerRadius(14)
                                .padding(.horizontal)
            }
            
  }
  .navigationTitle("Traffic Light")
  .padding(.bottom)

    }
}

struct TrafficLight3_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLight3()
    }
}
