//
//  HappyView.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 21/11/21.
//

import SwiftUI

struct InLoveView: View {
    
    @Binding var rootIsActive: Bool
    
    @State var dates = ["October 10", "October 13"]
    
    @State var texts = ["I met a  stray dog and he followed me home!","Cuddling all day with my puppy!"]
    
    @State var editMode = false
    
    
    var body: some View {
        VStack{
            
            notTappableEmoji(emoji: Image("innamorato"), color: Color(.systemOrange))
            
            Text("2 days")
                .font(.system(size: 17, weight: .regular, design: .default))
                .foregroundColor(Color(.systemGray))
            ZStack{
                
                ScrollView{
                    
                    JournalCard(date: dates[0], text: $texts[0], editMode: $editMode)
                    JournalCard(date: dates[1], text: $texts[1], editMode: $editMode)

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
        .navigationTitle("In Love")
    }
}

struct InLoveView_Previews: PreviewProvider {
    static var previews: some View {
        InLoveView(rootIsActive: .constant(true))
    }
}

