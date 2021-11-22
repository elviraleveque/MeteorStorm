//
//  HappyView.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 21/11/21.
//

import SwiftUI

struct HappyView: View {
    
    @Binding var rootIsActive: Bool
    
    @State var dates = ["November 10", "November 13", "November 14", "November 16"]
    
    @State var texts = ["Prova","Prova","Prova",]
    
    @State var editMode = false
    
    
    var body: some View {
        VStack{
            Spacer()
            notTappableEmoji(emoji: Image( "felice"), color: Color(.systemPurple))
                .padding(.top)
            
            Text("10 days")
                .font(.system(size: 17, weight: .regular, design: .default))
                .foregroundColor(Color(.systemGray))
            ZStack{
                
                ScrollView{
                    
                    JournalCard(date: dates[0], text: $texts[0], editMode: $editMode)
                    JournalCard(date: dates[1], text: $texts[1], editMode: $editMode)
                    JournalCard(date: dates[2], text: $texts[2], editMode: $editMode)

                }
            }

        }
        .toolbar{
            Button{
                editMode.toggle()
            } label: {
                Text(editMode ? "Done" : "Edit")
            }
        }
        .navigationBarBackButtonHidden(editMode ? true : false)
        .navigationTitle("Happy")
        .background(Color(.systemGray6))
    }
}

struct HappyView_Previews: PreviewProvider {
    static var previews: some View {
        HappyView(rootIsActive: .constant(true))
    }
}
