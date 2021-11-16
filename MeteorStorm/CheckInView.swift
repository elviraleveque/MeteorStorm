//
//  CheckInView.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 15/11/21.
//

import SwiftUI

struct CheckInView: View {
    
    @Binding var showCheckInView: Bool
    //Binding: the value will come from outside and will be shared with another view
    
    @Binding var emotionSelected: Int
    
    @Binding var doneCheck: Bool
    
    var body: some View {
        NavigationView {
            
            VStack{
                Spacer()
                
                Text("How do you feel today?")
                    .font(.system(size: 34, weight: .regular, design: .default))
                    .foregroundColor(Color.primary)
                    .padding()
                
                Text("Choose the emoji that \n represents you the most")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17, weight: .regular, design: .default))
                    .foregroundColor(Color(.systemGray))
                
                Spacer()
                
                HStack{
                    Spacer()
                    
                    CircleEmoji(emoji: "🥳", emotionIndex: 1, color: Color(.systemGreen), emotionSelected: $emotionSelected, showCheckInView: .constant(true))
                    
                    Spacer()
                    CircleEmoji(emoji: "😍", emotionIndex: 2, color: Color(.systemOrange), emotionSelected: $emotionSelected, showCheckInView: .constant(true))
                    
                    Spacer()
                    
                    CircleEmoji(emoji: "😮", emotionIndex: 3, color: Color(.systemPurple), emotionSelected: $emotionSelected, showCheckInView: .constant(true))
                    
                    Spacer()
                    
                } // Hstack circles row 1
                
                HStack{
                    
                    Spacer()
                    
                    CircleEmoji(emoji: "🥱", emotionIndex: 4, color: Color(.systemTeal).opacity(0.75), emotionSelected: $emotionSelected, showCheckInView: .constant(true))
                    
                    Spacer()
                    
                    CircleEmoji(emoji: "😐",emotionIndex: 5, color: Color(.systemYellow), emotionSelected: $emotionSelected, showCheckInView: .constant(true))
                    
                    Spacer()
                    
                } // Hstack circles row 2
                
                HStack{
                    
                    Spacer()
                    
                    CircleEmoji(emoji: "🤬", emotionIndex: 6, color: Color(.systemRed), emotionSelected: $emotionSelected, showCheckInView: .constant(true))
                    
                    Spacer()
                    
                    CircleEmoji(emoji: "😢", emotionIndex: 7, color: Color(.systemBlue).opacity(0.75), emotionSelected: $emotionSelected, showCheckInView: .constant(true))
                    
                    Spacer()
                    
                    CircleEmoji(emoji: "😱", emotionIndex: 8, color: Color(.systemBrown), emotionSelected: $emotionSelected, showCheckInView: .constant(true))
                    
                    Spacer()
                    
                } // Hstack circles row 3
                
                Spacer()
                NavigationLink(destination: CheckInView2(showCheckInView: $showCheckInView)){
                    
                    Text("Continue")
                        .font(.system(size: 17, weight: .semibold, design: .default))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color(.systemIndigo))
                        .cornerRadius(14)
                        .padding(.horizontal)
                    
                }
                
                
            }//VStack
            .navigationTitle("Check-in")
            .padding(.bottom)
            .toolbar{
                
                Button(action: {
                    self.showCheckInView = false
                    if emotionSelected != 0{
                        self.doneCheck = true
                    }
                }, label: {
                    Image(systemName: "xmark.circle")
                        .foregroundColor(Color(.systemIndigo))
                })
                
                
            }//Toolbar
            
        }//navigationView
    }
}

struct CheckInView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CheckInView(showCheckInView: .constant(true), emotionSelected: .constant(0), doneCheck: .constant(true))
            CheckInView(showCheckInView: .constant(true), emotionSelected: .constant(0), doneCheck: .constant(true))
                .preferredColorScheme(.dark)
        }
    }
}


/* NB: To avoid inconsistency, a view should refer ONLY to a SINGLE view. */

