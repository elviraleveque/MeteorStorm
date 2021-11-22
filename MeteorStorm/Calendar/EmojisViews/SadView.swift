//
//  HappyView.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 21/11/21.
//

import SwiftUI

struct SadView: View {
    
    @Binding var rootIsActive: Bool
    
    @State var dates = ["October 20", "October 21", "October 22", "October 23", "October 24"]
    
    @State var texts = ["My friends didn't call me to go out with them.... So sad","Maybe I did something wrong?","Why no one ever listen to me?!","I don't feel like doing anything...","I need to work on my project but I'm feeling gloomy..."]
    
    @State var editMode = false
    
    
    var body: some View {
        VStack{
            
            notTappableEmoji(emoji: Image("triste"), color: Color(.systemBlue))
            
            Text("5 days")
                .font(.system(size: 17, weight: .regular, design: .default))
                .foregroundColor(Color(.systemGray))
            ZStack{
                
                ScrollView{
                    
                    JournalCard(date: dates[0], text: $texts[0], editMode: $editMode)
                    JournalCard(date: dates[1], text: $texts[1], editMode: $editMode)
                    JournalCard(date: dates[2], text: $texts[2], editMode: $editMode)
                    JournalCard(date: dates[3], text: $texts[3], editMode: $editMode)
                    JournalCard(date: dates[4], text: $texts[4], editMode: $editMode)

                }
            }.background(Color(.systemGray6))
            
        }
        .toolbar{
            Button{
                editMode.toggle()
            } label: {
                Text(editMode ? "Done" : "Edit")
            }
        }
        .navigationBarBackButtonHidden(editMode ? true : false)
        .navigationTitle("Scared")
    }
}

struct SadView_Previews: PreviewProvider {
    static var previews: some View {
        SadView(rootIsActive: .constant(true))
    }
}

