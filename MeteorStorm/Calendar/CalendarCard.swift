//
//  CalendarCard.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 21/11/21.
//

import SwiftUI

struct CalendarCard<Destination: View>: View {
    let rectangle = RoundedRectangle(cornerRadius: 15)
    var emotion: notTappableEmoji
    var emoname: String
    var days: String
    var destination: Destination
    
    @Binding var isActive : Bool
    
    var body: some View {
        NavigationLink(destination: destination, isActive: self.$isActive, label: {
            ZStack{
                rectangle
                    .foregroundColor(.white)
                    .padding(.horizontal)
                   
                HStack{
                    emotion
                        .scaleEffect(0.7)
                    
                    VStack(alignment: .leading){
                        Text("\(emoname)")
                            .font(.system(size: 28, weight: .bold, design: .default))
                            .foregroundColor(Color(.black))
                        Text("\(days) days")
                            .font(.system(size: 17, weight: .regular, design: .default))
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .padding()
                }
                .padding(.horizontal)
                
        .foregroundColor(Color(.systemGray))
            }
        })
    }
}

//struct CalendarCard_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        CalendarCard(emotion:
//                        notTappableEmoji(emoji: Image("felice"), color: Color(.systemPurple)), emoname: "Happy", days: "10", destination: HappyView(rootIsActive: $isActive), isActive: true)
//    }
//}
