//
//  CalendarView.swift
//  MeteorStorm esercizio
//
//  Created by Vincenzo Pascarella on 14/11/21.
//

import SwiftUI

struct CalendarView: View {
    @State var isActive: [Bool] = [false, false, false, false, false]
   
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: 30){
                    
                    CalendarCard(emotion:
                                    notTappableEmoji(emoji: Image("felice"), color: Color(.systemPurple)), emoname: "Happy", days: "10", destination: HappyView(rootIsActive: self.$isActive[0]), isActive: $isActive[0])
                    
                    CalendarCard(emotion: notTappableEmoji(emoji: Image("neutro"), color: Color(.systemYellow)), emoname: "Blank", days: "6", destination: HappyView(rootIsActive: self.$isActive[0]), isActive: $isActive[0])
                    
                    CalendarCard(emotion: notTappableEmoji(emoji: Image("triste"), color: Color(.systemBlue)), emoname: "Sad", days: "5", destination: HappyView(rootIsActive: self.$isActive[0]), isActive: $isActive[0])
                    
                    CalendarCard(emotion: notTappableEmoji(emoji: Image("rabbia"), color: Color(.systemRed)), emoname: "Angry", days: "3", destination: HappyView(rootIsActive: self.$isActive[0]), isActive: $isActive[0])
                    
                    CalendarCard(emotion: notTappableEmoji(emoji: Image("paura"), color: Color(.systemBrown)), emoname: "Scared", days: "2", destination: HappyView(rootIsActive: self.$isActive[0]), isActive: $isActive[0])
                    
                    }
                }
            
        }
        .padding()
    }
}


struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}