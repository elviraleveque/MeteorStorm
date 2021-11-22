//
//  HappyView.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 21/11/21.
//

import SwiftUI

struct ScaredView: View {
    
    @Binding var rootIsActive: Bool
    
    @State var dates = ["October 02", "October 04"]
    
    @State var texts = ["I got a live presentation... I'm so scared!","Spider encounter"]
    
    @State var editMode = false
    
    
    var body: some View {
        VStack{
            Spacer()
            notTappableEmoji(emoji: Image("paura"), color: Color(.systemBrown))
                .padding(.top)
            
            Text("2 days")
                .font(.system(size: 17, weight: .regular, design: .default))
                .foregroundColor(Color(.systemGray))
            ZStack{
                
                ScrollView{
                    
                    JournalCard(date: dates[0], text: $texts[0], editMode: $editMode)
                    JournalCard(date: dates[1], text: $texts[1], editMode: $editMode)

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
        .navigationTitle("Scared")
        .background(Color( .systemGray6))
    }
}

struct ScaredView_Previews: PreviewProvider {
    static var previews: some View {
        ScaredView(rootIsActive: .constant(true))
    }
}
