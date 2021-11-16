//
//  NotTappableEmoji.swift
//  MeteorStorm
//
//  Created by Vincenzo Pascarella on 16/11/21.
//  This struct has been created as a second version of CircleEmojis, here the emoji is bigger and not tabbable

import SwiftUI

struct notTappableEmoji: View{
    
    var emoji: String
    var color: Color
    
    var body: some View{
        
            ZStack{
                
                Circle()
                    .frame(width: 130, height: 130)
                    .padding(.bottom)
                    .foregroundColor(color)

                
                Text(emoji)
                    .font(.system(size: 80))
                    .frame(width: 130, height: 130)
                    .padding(.bottom)
            }
    }
    
}
