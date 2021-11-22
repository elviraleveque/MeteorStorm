//
//  JournalCard.swift
//  MeteorStorm
//
//  Created by Vincenzo Pascarella on 22/11/21.
//

import SwiftUI

struct JournalCard: View {
    let date: String
    @Binding var text: String
    @Binding var editMode: Bool
    
    var body: some View {
        Spacer()
        
        Text(date)
            .font(.system(size: 28, weight: .bold, design: .default))
            .padding(.top)
        
        Spacer()
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 14)
                .padding(.horizontal)
                .foregroundColor(.white)
            
            if editMode{
            TextEditor(text: $text) //gets the text
                .disableAutocorrection(true)
                .padding(.horizontal, 20)
                .padding(.bottom)
                .padding(.top,8)
            }
            else {
                Text(text) //gets the text
                    .padding(.horizontal, 25)
                    .padding(.bottom, 24)
                    .padding(.top, 16.5)
                    .multilineTextAlignment(.leading)
            }
            
        }
    }
}

struct JournalCard_Previews: PreviewProvider {
    static var previews: some View {
        JournalCard(date: "June 20", text: .constant("ciao"), editMode: .constant(true))
    }
}
