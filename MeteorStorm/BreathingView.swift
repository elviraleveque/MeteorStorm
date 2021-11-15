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
    @State private var isVisible = false
    @State var currentDate = Date()
    @State var isActive = true
    
    var body: some View{
        NavigationView{
            VStack{
                Text("Inhale/Exhale")
                Spacer()
                ZStack {
                    Image("MovingCircle")
                        .scaleEffect(isVisible ? 1.5: 0.8)
                        .onAppear(perform: {
                            if(isActive) { withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)){
                                    self.isVisible.toggle()
                                }
                            }
                        })
                                        
                    Image("StaticCircle")
                }
                Spacer()
                CountDown(isActive: $isActive)
                Spacer()
            }
        }.navigationTitle("Breathing")
    }
}//view with the real exercise

func leadingZero(_ n:Int) -> String {
    return n < 10 ? "0\(n)" : "\(n)"
}

struct CountDown: View{
    @Binding var isActive: Bool
    @State private var timeRemaining = 15
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View{
        VStack{
            let minutes = Int(timeRemaining / 60)
            let seconds = timeRemaining % 60
            
            Text("\(leadingZero(minutes)) : \(leadingZero(seconds))")
            .font(.title)
            .fontWeight(.bold)
        }
        .onReceive(timer) { time in
            guard self.isActive else { return }
            
            if(timeRemaining == 0) {
                timer.upstream.connect().cancel()
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
