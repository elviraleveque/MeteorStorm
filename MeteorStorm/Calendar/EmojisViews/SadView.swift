//
//  HappyView.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 21/11/21.
//

import SwiftUI

struct SadView: View {
    
    @Binding var rootIsActive: Bool
    
    @State var dates = ["November 20", "November 21", "November 22", "November 23", "November 24"]
    
    @State var texts = ["My friends didn't call me to go out with them.... So sad","Maybe I did something wrong?","Why no one ever listen to me?!","I don't feel like doing anything...","I need to work on my project but I'm feeling gloomy..."]
    
    @State var editMode = false
    
    
    var body: some View {
        VStack{
            Spacer()
            notTappableEmoji(emoji: Image("triste"), color: Color(.systemBlue))
                .padding(.top)

            
            Text("5 days")
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
        .navigationTitle("Sad")
        .background(Color(.systemGray6))
        .navigationBarColor(.systemGray6)

    }
}

struct SadView_Previews: PreviewProvider {
    static var previews: some View {
        SadView(rootIsActive: .constant(true))
    }
}

