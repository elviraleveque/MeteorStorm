//
//  CircleEmoji.swift
//  MeteorStorm
//
//  Created by Vincenzo Pascarella on 16/11/21.
//
// This struct is created to be used in order to create the circles with the possibility to select the emojis

import SwiftUI

struct CircleEmoji: View{
    
    var emoji: String
    var emotionIndex: Int
    var color: Color
    @Binding var emotionSelected: Int
    @Binding var showCheckInView: Bool
    
    var body: some View{
        
        Button(action: {
            emotionSelected = emotionIndex
            showCheckInView = true
        },
               label: {
            ZStack{
            Circle()
                .frame(width: 86, height: 86)
                .padding(.bottom)
                .foregroundColor(.white)
                .opacity(0.00001)
                .overlay(
                    Circle()
                        .stroke(lineWidth: 5)
                        .foregroundColor(Color(.systemIndigo))
                        .padding(.bottom)
                        .opacity((emotionSelected == emotionIndex) ? 1 : 0)

                )
                

                Circle()
                    .frame(width: 76, height: 76)
                    .padding(.bottom)
                    .foregroundColor(color)

                
                Text(emoji)
                    .font(.system(size: 50))
                    .frame(width: 76, height: 76)
                    .padding(.bottom)
            }
        })
    }
}
