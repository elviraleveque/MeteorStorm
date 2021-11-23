//
//  HappyView.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 21/11/21.
//

import SwiftUI

struct HappyView: View {
    
    @Binding var rootIsActive: Bool
    
    @State var dates = ["November 06", "November 07", "November 08", "November 09", "November 11", "November 12"]
    
    @State var texts = ["Such a sunny day in November!","Today I have a day off from work!","I feel so relaxed!","I found 5 euros on the floor!","Everything is going smoothly.","I was praised at work! Yay, so proud of myself!"]
    
    @State var editMode = false
    
    
    var body: some View {
        VStack{
            Spacer()
            notTappableEmoji(emoji: Image( "felice"), color: Color(.systemPurple))
                .padding(.top)
            
            Text("6 days")
                .font(.system(size: 17, weight: .regular, design: .default))
                .foregroundColor(Color(.systemGray))
            ZStack{
                
                ScrollView{
                    Spacer()
                    JournalCard(date: dates[0], text: $texts[0], editMode: $editMode)
                    JournalCard(date: dates[1], text: $texts[1], editMode: $editMode)
                    JournalCard(date: dates[2], text: $texts[2], editMode: $editMode)
                    JournalCard(date: dates[3], text: $texts[3], editMode: $editMode)
                    JournalCard(date: dates[4], text: $texts[4], editMode: $editMode)
                    JournalCard(date: dates[5], text: $texts[5], editMode: $editMode)

                }

            }


        }
        .onTapGesture{
            hideKeyboard()
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
        .navigationBarColor(.systemGray6)

    }
}

struct HappyView_Previews: PreviewProvider {
    static var previews: some View {
        HappyView(rootIsActive: .constant(true))
    }
}
