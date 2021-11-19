//
//  Lights.swift
//  MeteorStorm
//
//  Created by Vincenzo Pascarella on 19/11/21.
//

import SwiftUI

struct Light: View {
    var color: Color
    var duration: Double
    @Binding var count: Int
    @State private var animationDuration: Double = 1
    @State private var timerCounter = 0

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()


    var body: some View {
            
        ZStack{
            
            Circle()
            
        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1-animationDuration)*360-90), clockwise: true)
                .onAppear{
                animationDuration = 1
                withAnimation(.linear(duration: duration)){
                    animationDuration = 0
                }
            }
            .opacity(0.2)
            .foregroundColor(.white)
            .onReceive(timer, perform: {
                timerCounter in
                self.timerCounter += 1
                if self.timerCounter >= Int(duration){
                    count += 1
                }
            })

            
                        
        }
            .frame(width: UIScreen.main.bounds.size.height / 3, height: UIScreen.main.bounds.size.width - 32)
            .foregroundColor(color)
    }
}

struct Light_Previews: PreviewProvider {
    static var previews: some View {
        Light(color: .orange, duration: 10, count: .constant(0))
    }
}
