//
//  CheckInView2.swift
//  MeteorStorm
//
//  Created by Vincenzo Pascarella on 16/11/21.
//

import SwiftUI

struct CheckInView2: View {
    @Binding var showCheckInView: Bool
    @State private var additional: String = ""
    
    @Binding var doneCheck: Bool

    
    
    var body: some View {
        VStack{
            Spacer()
            
            Text("Do you want to add something?")
                .font(.system(size: 34, weight: .regular, design: .default))
                .foregroundColor(Color.primary)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("You can leave it blank \n if you don’t feel like answering it")
                .multilineTextAlignment(.center)
                .font(.system(size: 17, weight: .regular, design: .default))
                .foregroundColor(Color(.systemGray))
            
            
            TextField(
                "Today I'm feeling...",
                text: $additional
            )
                .disableAutocorrection(true)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color(.systemIndigo), lineWidth: 2)
                )
                .padding()
            
            Spacer()
            
            Spacer()
            
            
            
            Button(action: {
                self.showCheckInView = false
                self.doneCheck = true

                
            }, label: {
                Text("Done")
                    .font(.system(size: 17, weight: .semibold, design: .default))
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color(.systemIndigo))
                    .cornerRadius(14)
                    .padding(.horizontal)
                
            })
            
            
            
            
            
        }//VStack
        .navigationTitle("Check-In")
        .padding(.bottom)
        .toolbar{
            
            Button(action: {
                self.showCheckInView = false
                self.doneCheck = true

            }, label: {
                Text("Cancel")
                    .foregroundColor(Color(.systemIndigo))
            })
        }
    }
}

struct CheckInView2_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CheckInView2(showCheckInView: .constant(true), doneCheck: .constant(true))
            CheckInView2(showCheckInView: .constant(true), doneCheck: .constant(true))
                .preferredColorScheme(.dark)
        }
    }
}
