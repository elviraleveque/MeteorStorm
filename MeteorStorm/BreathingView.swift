//
//  BreathingView.swift
//  MeteorStorm
//
//  Created by Fabiana Ferrara on 13/11/21.
//
import SwiftUI
import Foundation



struct BreathingView: View {
          @Binding var rootIsActive : Bool
          @Binding var isCompleted : Bool
          
          var body: some View {
                    NavigationView{
                    VStack{
                              Spacer()
                              Image(systemName: "lungs")
                                        .resizable(resizingMode: .tile)
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(Color(.systemIndigo))
                                        .frame(width: 123, height: 86)
                              
                              
                              VStack(alignment: .leading){
                                        Text("Sit on a chair that supports your back or lay on a yoga mat on the floor.")
                                                  .padding()
                                        
                                        Text("Breath in through your nose and out through your mouth.")
                                                  .padding(.horizontal)
                              }
                              
                              Spacer()
                              
                              Text("Ready?").font(.largeTitle).fontWeight(.bold).padding()
                              
                              NavigationLink(destination: BreathingExercise(rootIsActive: self.$rootIsActive, isCompleted: $isCompleted)) {
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
                                   self.rootIsActive = false                                } label: {
                                        Text("Close")
                                                  .foregroundColor(Color(.systemIndigo))
                              }
                              
                    }//Toolbar
                    }
                    .accentColor(Color(.systemIndigo))

                    
          }
}

func leadingZero(_ n:Int) -> String {
          return n < 10 ? "0\(n)" : "\(n)"
}
let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

struct CountDown: View{
          @Binding var isActive: Bool
          @State private var timeRemaining = 80
          @State private var buttonOpacity = 0.0
          @Binding var isCompleted : Bool
          @Binding var rootIsActive: Bool
          
          var body: some View{
                    VStack{
                              let minutes = Int(timeRemaining / 60)
                              let seconds = timeRemaining % 60
                              
                              Text("\(leadingZero(minutes)) : \(leadingZero(seconds))")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding()
                              Button(action: {
                                        if buttonOpacity == 1.0{
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
                                                  .opacity(buttonOpacity)
                                                  .padding(.horizontal)
                                        
                              })
                              
                    }//VStack
                    .onReceive(timer) { time in
                              guard self.isActive else { return }
                              
                              if(timeRemaining == 0) {
                                        timer.upstream.connect().cancel()
                                        buttonOpacity = 1.0
                              }
                              
                              if self.timeRemaining > 0 {
                                        self.timeRemaining -= 1
                              }
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                              self.isActive = false
                              
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                              self.isActive = true
                    }
          }
}//CountdownView


struct TextSwitch: View {
          @State var texts = ["Inhale", "Exhale"]
          let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
          @State var timeText = 16
          var body: some View{
                    ZStack {
                              Text("\(texts[timeText%2])")
                                        .fontWeight(.semibold)
                                        .font(.system(size: 30))
                                        .onReceive(timer) {_ in
                                                  
                                                  if timeText > 0
                                                  {
                                                            timeText -= 1
                                                            
                                                  }
                                        }
                              
                    }
          }
}

//struct BreathingView_Previews: PreviewProvider {
//          static var previews: some View {
//                    Group {
//                              BreathingView(rootIsActive: .constant(true))
//                                        .preferredColorScheme(.light)
//                              BreathingView(rootIsActive: .constant(false))
//                                        .preferredColorScheme(.dark)
//                    }
//          }
//}
