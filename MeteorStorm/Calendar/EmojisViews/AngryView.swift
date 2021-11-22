//
//  HappyView.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 21/11/21.
//

import SwiftUI

struct AngryView: View {
    
    @Binding var rootIsActive: Bool
    
    @State var dates = ["October 01", "October 03", "October 05"]
    
    @State var texts = ["My teammate was so rude with me, but I didn't have the chance to reply!","Still upset because of my teammate. Can't stop thinking about it!","I talked with him and he didn't even pay attention!",]
    
    @State var editMode = false
    
    
    var body: some View {
        VStack{
            
            notTappableEmoji(emoji: Image("rabbia"), color: Color(.systemRed))
            
            Text("3 days")
                .font(.system(size: 17, weight: .regular, design: .default))
                .foregroundColor(Color(.systemGray))
            ZStack{
                
                ScrollView{
                    
                    JournalCard(date: dates[0], text: $texts[0], editMode: $editMode)
                    JournalCard(date: dates[1], text: $texts[1], editMode: $editMode)
                    JournalCard(date: dates[2], text: $texts[2], editMode: $editMode)

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
        .navigationTitle("Angry")
    }
}

struct AngryView_Previews: PreviewProvider {
    static var previews: some View {
        AngryView(rootIsActive: .constant(true))
    }
}

