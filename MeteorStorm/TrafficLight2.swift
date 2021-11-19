//
//  TrafficLight2.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 17/11/21.
//

import SwiftUI



struct TrafficLight2: View {
    
    @State var isVisible = false
    @State var currentDate = Date()
    @State var isActive = true
    
    @State var timeRemaining = [10, 6, 7]
    @State var emotions = ["","",""]
    @State var thoughts = ["","",""]
    
    @State var empty = false
    
    @State var count = 0

    
    var body: some View {
        
        VStack{
            
            if count == 0{

                Light(color: Color(.systemRed), duration: 10)
                
                
                Text("Topic:")
                    .font(.largeTitle).fontWeight(.bold).padding()
                
                Text("Family")
                    .font(.system(size: 34, weight: .regular, design: .default))
                    .foregroundColor(Color.primary)

                
                
            }
            else if count == 1{
                
                
                Text("Emotions:")
                    .font(.largeTitle).fontWeight(.bold).padding()
                
                TextField("What do you feel?", text: $emotions[0]) //gets the text
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color(.systemYellow), lineWidth: 2)
                    )
                    .padding()
                
                TextField("What do you feel?", text: $emotions[1]) //gets the text
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color(.systemYellow), lineWidth: 2)
                    )
                    .padding()
                
                TextField("What do you feel?", text: $emotions[2]) //gets the text
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color(.systemYellow), lineWidth: 2)
                    )
                    .padding()
                
                Spacer()
                

            }
            else if count == 2 {
                
                Text("Thoughts:")
                    .font(.largeTitle).fontWeight(.bold).padding()
                
                
                TextField("Why \(emotions[0])?", text: $thoughts[0]) //gets the text
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color(.systemGreen), lineWidth: 2)
                    )
                    .padding()
                
                
                
                TextField("Why \(emotions[1])?", text: $thoughts[1]) //gets the text
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color(.systemGreen), lineWidth: 2)
                    )
                    .padding()
                
                
                
                
                TextField("Why \(emotions[2])?", text: $thoughts[2]) //gets the text
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color(.systemGreen), lineWidth: 2)
                    )
                    .padding()
                
                
            }
            else{
                TrafficLight3()
                
            }
            
        }
        
    }
    
    
}//VStack



struct TrafficLight2_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLight2()
    }
}
