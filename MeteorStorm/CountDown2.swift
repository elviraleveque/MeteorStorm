//
//  CountDown2.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 18/11/21.
//

import SwiftUI

struct CountDown2: View{
          @Binding var isActive: Bool
          @Binding var count: Int
          @Binding var timeRemaining: Int
    
          @State private var buttonOpacity = 0.0
          
          var body: some View{
                    VStack{
                              let minutes = Int(timeRemaining / 60)
                              let seconds = timeRemaining % 60
                              
                              Text("\(leadingZero(minutes)) : \(leadingZero(seconds))")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding()
                              
                    }//VStack
                    .onReceive(timer) { time in
                              guard self.isActive else { return }
                        
                              if(timeRemaining == 1) {
                                        timer.upstream.connect().cancel()
                                        buttonOpacity = 1.0
                                        self.count += 1
                              }
                              
                              if self.timeRemaining > 1 {
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

//struct CountDown2_Previews: PreviewProvider {
//    static var previews: some View {
//        CountDown2()
//    }
//}
