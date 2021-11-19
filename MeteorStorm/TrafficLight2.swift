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
    
    @State var timeRemaining = [5, 6, 7]
    @State var emotions = ["","",""]
    @State var thoughts = ["","",""]
    
    @State var empty = false
    
    @State var count = 0
    
    @State private var animatedBonusRemaining: Double = 5
    
    var body: some View {
        
        VStack{
            
            if count == 0{
                
//                CountDown2(isActive: $isActive, count: $count, timeRemaining: $timeRemaining[0])
                
//                Stoplight(color: .red)
                
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90), clockwise: true)
                    .onAppear{
//                        self.animatedBonusRemaining = 5
                        withAnimation(.linear(duration: 3)){
                            animatedBonusRemaining = 0
                        }
                    }
                
                Text("Topic:")
                    .font(.largeTitle).fontWeight(.bold).padding()
                
                Text("Family")
                    .font(.system(size: 34, weight: .regular, design: .default))
                    .foregroundColor(Color.primary)
                    
                Spacer()
                
        
            }
            else if count == 1{
                
                CountDown2(isActive: $isActive, count: $count, timeRemaining: $timeRemaining[1])
                
                Stoplight(color: .yellow)
                
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
                
//                                if (emotions[0] == "" && emotions[1] == "" && emotions[2] == ""){
//                                    Text("Continue")
//                                              .padding(.vertical)
//                                              .frame( maxWidth: .infinity)
//                                              .foregroundColor(Color.white)
//                                              .background(Color(.systemIndigo)).cornerRadius(14)
//                                              .padding(.horizontal)
//                                              .opacity(0.5)
//                                                }
//                                else{
//                                    Text("Continue")
//                                              .padding(.vertical)
//                                              .frame( maxWidth: .infinity)
//                                              .foregroundColor(Color.white)
//                                              .background(Color(.systemIndigo)).cornerRadius(14)
//                                              .padding(.horizontal)
//                                              .opacity(0.5)
//                                    }
                
            }
            else if count == 2 {
                
                CountDown2(isActive: $isActive, count: $count, timeRemaining: $timeRemaining[2])
                
                Stoplight(color: .green)
                
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
