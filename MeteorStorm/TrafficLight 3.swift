//
//  TrafficLight3.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 18/11/21.
//

import SwiftUI

struct TrafficLight3: View {
    @Binding var rootIsActive : Bool
    @Binding var isCompleted : Bool
    
    let quote1 = "Thinking about your emotions helps you to increase your self awareness."
    let quote2 = "If you have a clear perception of your emotions you can manage them, build on your strenghts and improve on your weakness."
    
    var body: some View {
        VStack{
            Spacer()
            Image("traffic Light")
                .resizable(resizingMode: .tile)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color(.systemIndigo))
                .frame(width: 123, height: 86)
                .padding()
            
            
            VStack(alignment: .leading){
                Text("Great, you have ended the exercise!")
                    .padding()
                    .font(.title2)
                
                Text(quote1)
                    .padding(.horizontal)
                Text(quote2)
                    .padding()
            }
            
            Spacer()
            
            Button(action: {
                self.rootIsActive = false
                self.isCompleted = true
            }, label: {
                Text("Done")
                    .padding(.vertical)
                    .frame( maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color(.systemIndigo)).cornerRadius(14)
                    .padding(.horizontal)
            })
            
        }
        .padding(.bottom)
        .toolbar{
            
            Button{
                self.rootIsActive = false                                } label: {
                    Text("Close")
                        .foregroundColor(Color(.systemIndigo))
                }
            
        }//Toolbar
        
    }
}


struct TrafficLight3_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TrafficLight3(rootIsActive: .constant(false), isCompleted: .constant(false))
                .preferredColorScheme(.light)
        }
    }
}
