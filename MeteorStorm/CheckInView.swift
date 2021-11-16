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
    
    var body: some View {
        NavigationView {
            
        VStack{
            Text("How do you feel today?")
                .font(.system(size: 34, weight: .regular, design: .default))
                .foregroundColor(.black)
                .padding()
            
            ZStack{
                HStack{
                    Spacer()
                    Button(action: {
                        
                    },
                           label: {
                        Circle()
                            .frame(width: 76, height: 76)
                            .padding(.bottom)
                            .foregroundColor(Color(.systemRed))
                    })
                    
                    Spacer()
                    Button(action: {
                        
                    },
                           label: {
                        Circle()
                            .frame(width: 76, height: 76)
                            .padding(.bottom)
                            .foregroundColor(Color(.systemGreen))
                    })
                    
                    Spacer()
                    Circle()
                        .frame(width: 76, height: 76)
                        .padding(.bottom)
                        .foregroundColor(Color(.systemYellow))
                    
                    Spacer()
                    
                } // Hstack circles
                
                HStack{
                    Spacer()
                    Text("🤬")
                        .font(.system(size: 50))
                        .frame(width: 76, height: 76)
                        .padding(.bottom)
                    
                    Spacer()
                    Text("🥳")
                        .font(.system(size: 50))
                        .frame(width: 76, height: 76)
                        .padding(.bottom)
                    
                    Spacer()
                    Text("😐")
                        .font(.system(size: 50))
                        .frame(width: 76, height: 76)
                        .padding(.bottom)
                    
                    Spacer()
                }// Hstack Emoji
            }// Zstack emotions
            
            ZStack{
                HStack{
                    
                    Spacer()
                    Circle()
                        .frame(width: 76, height: 76)
                        .padding(.bottom)
                        .foregroundColor(Color(.systemYellow))
                    
                    Spacer()
                    Circle()
                        .frame(width: 76, height: 76)
                        .padding(.bottom)
                        .foregroundColor(Color(.systemTeal))
                    Spacer()
                    
                } // Hstack circles
                
                HStack{
                    
                    Spacer()
                    Text("😐")
                        .font(.system(size: 50))
                        .frame(width: 76, height: 76)
                        .padding(.bottom)
                    
                    Spacer()
                    Text("😢")
                        .font(.system(size: 50))
                        .frame(width: 76, height: 76)
                        .padding(.bottom)
                    Spacer()
                }// Hstack Emoji
            }
            
            ZStack{
                HStack{
                    
                    Spacer()
                    Circle()
                        .frame(width: 76, height: 76)
                        .padding(.bottom)
                        .foregroundColor(Color(.systemGreen))
                    
                    Spacer()
                    Circle()
                        .frame(width: 76, height: 76)
                        .padding(.bottom)
                        .foregroundColor(Color(.systemYellow))
                    
                    Spacer()
                    Circle()
                        .frame(width: 76, height: 76)
                        .padding(.bottom)
                        .foregroundColor(Color(.systemTeal))
                    Spacer()
                    
                } // Hstack circles
                
                HStack{
                    
                    Spacer()
                    Text("🥳")
                        .font(.system(size: 50))
                        .frame(width: 76, height: 76)
                        .padding(.bottom)
                    
                    Spacer()
                    Text("😐")
                        .font(.system(size: 50))
                        .frame(width: 76, height: 76)
                        .padding(.bottom)
                    
                    Spacer()
                    Text("😢")
                        .font(.system(size: 50))
                        .frame(width: 76, height: 76)
                        .padding(.bottom)
                    Spacer()
                }// Hstack Emoji
            }

            Button(action: {
                self.showCheckInView = false
            }, //.append adds the item at the end of the list . insert at the start
                   label: {
                Text("Continue")
                    .font(.system(size: 17, weight: .semibold, design: .default))
            })
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color(.systemIndigo))
                .cornerRadius(14)
                .padding(.horizontal)
                
            }//VStack
        .navigationTitle("Check-in")
        .padding(.bottom)
        .toolbar{
            
            Button(action: {
                self.showCheckInView = false
            }, label: {
                Image(systemName: "xmark.circle")
                    .foregroundColor(Color(.systemIndigo))
            })
            
        }//Toolbar
            
        }//navigationView
    }
}

/* NB: To avoid inconsistency, a view should refer ONLY to a SINGLE view. */

