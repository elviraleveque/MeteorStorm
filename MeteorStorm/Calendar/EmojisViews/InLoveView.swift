//
//  HappyView.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 21/11/21.
//

import SwiftUI

struct InLoveView: View {
    
    @Binding var rootIsActive: Bool
    
    @State var dates = ["November 10", "November 15", "November 19", "November 26"]
    
    @State var texts = ["I met a stray dog and he followed me home!","Cuddling all day with my puppy!", "My project is shaping up and it looks awesome", "My presentation day was great!"]
    
    @State var editMode = false
    
    
    var body: some View {
        VStack{
            Spacer()
            notTappableEmoji(emoji: Image("innamorato"), color: Color(.systemOrange))
                .padding(.top)
            
            Text("4 days")
                .font(.system(size: 17, weight: .regular, design: .default))
                .foregroundColor(Color(.systemGray))
            ZStack{
                
                ScrollView{
                    Spacer()

                    JournalCard(date: dates[0], text: $texts[0], editMode: $editMode)
                    JournalCard(date: dates[1], text: $texts[1], editMode: $editMode)
                    JournalCard(date: dates[2], text: $texts[2], editMode: $editMode)
                    JournalCard(date: dates[3], text: $texts[3], editMode: $editMode)

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
        .navigationTitle("In Love")
        .background(Color( .systemGray6))
    }
}

struct InLoveView_Previews: PreviewProvider {
    static var previews: some View {
        InLoveView(rootIsActive: .constant(true))
    }
}

