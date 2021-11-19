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
    @State private var animationDuration: Double = 0
    
    var body: some View {
        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1-animationDuration)*360-90), clockwise: true)
            .onAppear{
                animationDuration = 1
                withAnimation(.linear(duration: duration).delay(0)){
                    animationDuration = 0
                }
            }
            .frame(width: UIScreen.main.bounds.size.height / 3, height: UIScreen.main.bounds.size.width - 32)
            .foregroundColor(color)
    }
}

struct Light_Previews: PreviewProvider {
    static var previews: some View {
        Light(color: .orange, duration: 10)
    }
}
