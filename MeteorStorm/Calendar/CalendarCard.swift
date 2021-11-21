//
//  CalendarCard.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 21/11/21.
//

import SwiftUI

struct CalendarCard<Destination: View>: View {
    
    var emotion: notTappableEmoji
    var emoname: String
    var days: String
    var destination: Destination
    
    @Binding var isActive : Bool
    
    var body: some View {
        NavigationLink(destination: destination, isActive: self.$isActive, label: {
        HStack(spacing: 15){
        emotion
                .scaleEffect(0.7)
            
            Spacer()
            
            VStack(spacing: 5){
                Text("\(emoname)")
                    .font(.system(size: 28, weight: .bold, design: .default))
                    .foregroundColor(Color(.black))
                Text("\(days) days")
                    .font(.system(size: 17, weight: .regular, design: .default))
            }.padding()
        }
        .foregroundColor(Color(.systemGray))
        .padding()
        })
    }
}

//struct CalendarCard_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarCard<<#Destination: View#>>(emotion: notTappableEmoji(emoji: Image("felice"), color: Color(.systemPurple)), emoname: "Happy", days: "10")
//    }
//}
