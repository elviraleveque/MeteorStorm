//
//  HappyView.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 21/11/21.
//

import SwiftUI

struct HappyView: View {
    
    @Binding var rootIsActive: Bool
    @State var text1 = "Lololol"
    
    
    var body: some View {
        VStack{
            notTappableEmoji(emoji: Image( "felice"), color: Color(.systemPurple))
            Text("10 days")
                .font(.system(size: 17, weight: .regular, design: .default))
                .foregroundColor(Color(.systemGray))
            ZStack{
                
            ScrollView{
                Spacer()
                Text("June 20")
                            .font(.system(size: 28, weight: .bold, design: .default))
                
                Spacer()
        
                TextEditor( text: $text1) //gets the text
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(Color(.white))
                    )
                    .padding()
    
                
                Text("June 21")
                            .font(.system(size: 28, weight: .bold, design: .default))
                
                Spacer()
                TextEditor( text: $text1) //gets the text
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color(.white), lineWidth: 2)
                    )
                    .padding()
                Text("June 22")
                            .font(.system(size: 28, weight: .bold, design: .default))
                
                Spacer()
                TextEditor( text: $text1) //gets the text
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color(.white), lineWidth: 2)
                    )
                    .padding()
                
            }
            }.background(Color( #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)))
        }.toolbar{
            EditButton()
        }
}
}

struct HappyView_Previews: PreviewProvider {
    static var previews: some View {
        HappyView(rootIsActive: .constant(true))
    }
}
