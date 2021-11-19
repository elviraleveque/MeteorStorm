//
//  NotTappableEmoji.swift
//  MeteorStorm
//
//  Created by Vincenzo Pascarella on 16/11/21.
//  This struct has been created as a second version of CircleEmojis, here the emoji is bigger and not tabbable

import SwiftUI

struct notTappableEmoji: View{
    
    var emoji: Image
    var color: Color
    
    var body: some View{
        
            ZStack{
                
                Circle()
                    .padding(.bottom)
                    .foregroundColor(color)

                
                emoji
                    .scaleEffect(1.71)
                    .padding(.bottom)
            }
            .frame(width: 130, height: 130)

    }
    
}
