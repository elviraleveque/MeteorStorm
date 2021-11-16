//
//  BreathingView.swift
//  MeteorStorm
//
//  Created by Fabiana Ferrara on 13/11/21.
//
import SwiftUI
import Foundation



struct BreathingView: View {
          var body: some View {
                    NavigationView {
                              VStack{
                                        Spacer()
                                        Image(systemName: "lungs")
                                                  .resizable(resizingMode: .tile)
                                                  .aspectRatio(contentMode: .fit)
                                                  .foregroundColor(Color(.systemIndigo))
                                                  .frame(width: 123, height: 86)
                                        
                                        
                                        
                                        Text("Sit on a chair that supports your back or lay    \non a yoga  mat on the floor.")
                                        
                                                  .padding(.vertical)
                                        
                                        Text("Breath in through your nose and out through your mouth.")
                                        
                                        Spacer()
                                        
                                        Text("Ready?").font(.largeTitle).fontWeight(.bold).padding()
                                        
                                        NavigationLink(destination: BreathingExercise()) {
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
                                                  //Place the action that the button performs
                                        } label: {
                                                  Image(systemName: "gearshape")
                                                            .foregroundColor(Color(.systemIndigo))
                                        }
                                        
                              }//Toolbar
                              
                    }//navigationView
          }
}


struct BreathingExercise: View {
          @State var isVisible = false
          @State var currentDate = Date()
          @State var isActive = true
          
          var body: some View{
                    NavigationView{
                              VStack{
                                        TextSwitch()
//
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
                                        
                              }//VsTack
                    }.navigationTitle("Breathing")
          }
}//view with the real exercise

func leadingZero(_ n:Int) -> String {
          return n < 10 ? "0\(n)" : "\(n)"
}
let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

struct CountDown: View{
          @Binding var isActive: Bool
          @State private var timeRemaining = 5
          @State private var buttonOpacity = 0.0
          
          var body: some View{
                    VStack{
                              let minutes = Int(timeRemaining / 60)
                              let seconds = timeRemaining % 60
                              
                              Text("\(leadingZero(minutes)) : \(leadingZero(seconds))")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding()
                              Button(action: {
                                        
                              }, label: {Text("Done")})
                              
                                        .padding(.vertical)
                                        .frame( maxWidth: .infinity)
                                        .foregroundColor(Color.white)
                                        .background(Color(.systemIndigo)).cornerRadius(14)
                                        .opacity(buttonOpacity)
                                        .padding()
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

//var texts = ["Inhale", "Exhale"]
//let texTimer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
//var timeText = 16
//
//
//func TextSwitch() {
//          Text("\(texts[timeText%2])")
//                    .onReceive(timer) {_ in
//
//                              if timeText > 0 {
//                    timeText -= 1
//
//                                        }
//                    }
//}

struct TextSwitch: View {
          @State var texts = ["Inhale", "Exhale"]
          let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
          @State private var timer2 = 6
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

struct BreathingView_Previews: PreviewProvider {
          static var previews: some View {
                    Group {
                              BreathingExercise()
                                        .preferredColorScheme(.light)
                              BreathingExercise()
                                        .preferredColorScheme(.dark)
                    }
          }
}
