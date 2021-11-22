//
//  HappyView.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 21/11/21.
//

import SwiftUI

struct BlankView: View {
    
    @Binding var rootIsActive: Bool
    
    @State var dates = ["October 26", "October 27", "October 28", "October 29","October 30", "October 31"]
    
    @State var texts = ["I don't feel anything.","I'm feeling quite indifferent.","I have a day off, but I don't know what to do.","Bored.","I don't know how I feel.","Hard to explain how I feel today."]
    
    @State var editMode = false
    
    
    var body: some View {
        VStack{
            
            notTappableEmoji(emoji: Image("neutro"), color: Color(.systemYellow))
            
            Text("6 days")
                .font(.system(size: 17, weight: .regular, design: .default))
                .foregroundColor(Color(.systemGray))
            ZStack{
                
                ScrollView{
                    
                    JournalCard(date: dates[0], text: $texts[0], editMode: $editMode)
                    JournalCard(date: dates[1], text: $texts[1], editMode: $editMode)
                    JournalCard(date: dates[2], text: $texts[2], editMode: $editMode)
                    JournalCard(date: dates[3], text: $texts[3], editMode: $editMode)
                    JournalCard(date: dates[4], text: $texts[4], editMode: $editMode)
                    JournalCard(date: dates[5], text: $texts[5], editMode: $editMode)

                }
            }.background(Color( .systemGray6))
            
        }
        .toolbar{
            Button{
                editMode.toggle()
            } label: {
                Text(editMode ? "Done" : "Edit")
            }
        }
        .navigationBarBackButtonHidden(editMode ? true : false)
        .navigationTitle("Blank")
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(rootIsActive: .constant(true))
    }
}

