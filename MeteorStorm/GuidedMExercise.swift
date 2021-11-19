//
//  GuidedMExercise.swift
//  MeteorStorm
//
//  Created by Fabiana Ferrara on 17/11/21.
//

import Foundation
import SwiftUI


struct TextMed: View {
    let textOne = "Just close the eyes, sense your body sitting, sense your posture. Take a few mindful breaths, and be aware of the soundscape that’s all around you."
    let textTwo = "Open your eyes softly, slowly, gently. Have the gaze looking down, maybe four or five feet in front of you. Relax the eyes. Cultivate that sense of receiving through the eyes.And in this practice, try not to lose touch with the sense of your body sitting, with the sense of your breath and the sounds."
    let textThree = "Shift your gaze from the lowered-gaze position to just looking straight ahead. Notice how that changes your experience. The more we lift the eyes, the more energizing the practice."
    let textFour = "And then let your gaze rest wherever is most comfortable, which is often just below the horizon. As you lower the gaze, it relaxes the eyes, it relaxes the nervous system; it supports a little more concentration."

    
          var body: some View {
                    VStack{
                              Spacer()
                           
                        GuidedMExercise(meditationTexts: [textOne,textTwo,textThree,textFour])
                            .padding()
                              Spacer()
                              
                              
                              
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

struct GuidedMExercise: View{
    @State var meditationTexts : [String]
    let timerText = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State var timeTextMed = 0
    var body: some View{
        ZStack {
                  Text("\(meditationTexts[timeTextMed])")
                            .fontWeight(.semibold)
                            .font(.system(size: 30))
                            .onReceive(timerText) {_ in
                                      
                                      if timeTextMed < 3
                                      {
                                                timeTextMed += 1
                                                
                                      }
                            }
                  
        }
    }
}

struct TextMed_Previews: PreviewProvider {
          static var previews: some View {
                    Group {
                              TextMed()
                                        .preferredColorScheme(.light)
                              TextMed()
                                        .preferredColorScheme(.dark)
                    }
          }
}

