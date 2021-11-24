//
//  GuidedMExercise.swift
//  MeteorStorm
//
//  Created by Fabiana Ferrara on 17/11/21.
//

import Foundation
import SwiftUI


struct TextMed: View {
    @Binding var rootIsActive : Bool
    @Binding var isCompleted : Bool
    @State var buttonOpacity = false
    
    let text1 = "Just close the eyes, sense your body sitting, sense your posture."
    let text2 = "Take a few mindful breaths, and be aware of the soundscape that’s all around you."
    let text3 = "Open your eyes softly, slowly, gently."
    let text4 = "Have the gaze looking down, maybe four or five feet in front of you."
    let text5 = "Relax the eyes.\nCultivate that sense of receiving through the eyes."
    let text6 = "And in this practice, try not to lose touch with the sense of your body sitting, with the sense of your breath and the sounds."
    let text7 = "Shift your gaze from the lowered-gaze position to just looking straight ahead."
    let text8 = "Notice how that changes your experience."
    let text9 = "The more we lift the eyes,\nthe more energizing the practice."
    let text10 = "And then let your gaze rest wherever is most comfortable,\nwhich is often just below the horizon."
    let text11 = "As you lower the gaze,\nit relaxes the eyes,\nit relaxes the nervous system;\nit supports a little more concentration."
    
    
    var body: some View {
        VStack{
            Spacer()
            
            GuidedMExercise(meditationTexts: [text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11], buttonOpacity: $buttonOpacity)
                .padding()
            
            Spacer()
            
            Button(action: {
                      if buttonOpacity{
                      self.rootIsActive = false
                      self.isCompleted = true
                      }
                      
            }, label:
                      {
                      Text("Done")
                                .padding(.vertical)
                                .frame( maxWidth: .infinity)
                                .foregroundColor(Color.white)
                                .background(Color(.systemIndigo)).cornerRadius(14)
                                .opacity(buttonOpacity ? 1 : 0)
                                .padding()
                      
            })
            
            
        }//VStack
        .navigationTitle("Guided Meditation")
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

struct GuidedMExercise: View{
    @State var meditationTexts : [String]
    let timerText = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State var timeTextMed = 0
    @Binding var buttonOpacity: Bool
    var body: some View{
        ZStack {
            Text("\(meditationTexts[timeTextMed])")
                .font(.title2)
                .animation(.easeInOut(duration: 2))
                .onReceive(timerText) {_ in
                    
                    if timeTextMed < 10
                    {
                        timeTextMed += 1
                        
                    }
                    else {
                        timeTextMed = 0
                        buttonOpacity = true
                    }
                }
            
        }
    }
}

