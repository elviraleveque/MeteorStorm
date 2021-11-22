//
//  HappyView.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 21/11/21.
//

import SwiftUI

struct ScaredView: View {
    
    @Binding var rootIsActive: Bool
    
    @State var dates = ["November 02", "November 04"]
    
    @State var texts = ["I've to do an hard project and I'm not so good in coding... I'm so scared!","Spider encounter"]
    
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
                    Spacer()
                    JournalCard(date: dates[0], text: $texts[0], editMode: $editMode)
                    JournalCard(date: dates[1], text: $texts[1], editMode: $editMode)

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
        .navigationTitle("Scared")
        .background(Color( .systemGray6))
        .navigationBarColor(.systemGray6)

    }
}

struct ScaredView_Previews: PreviewProvider {
    static var previews: some View {
        ScaredView(rootIsActive: .constant(true))
    }
}
