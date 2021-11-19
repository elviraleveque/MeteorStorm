//
//  RelationshipCaring3.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 16/11/21.
//

import SwiftUI

struct SelfEsteemExercise: View {
    @Binding var rootIsActive : Bool
    @Binding var isCompleted : Bool


    @State private var feature1: String = ""
    @State private var feature2: String = ""
    @State private var feature3: String = ""

    
        var body: some View {
//            NavigationView {
                      VStack{
                          Spacer()
                                Text("What do you like about yourself?")
                                    .font(.system(size: 34, weight: .regular, design: .default))
                                    .foregroundColor(Color.primary)
                                    .padding()
                          
                                Text("List down three traits of you personality that you like")
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 17, weight: .regular, design: .default))
                                    .foregroundColor(Color(.systemGray))
                                    .padding()
                          
                          TextField("Type some feature...", text: $feature1) //gets the text
                              .disableAutocorrection(true)
                              .padding()
                              .overlay(
                                  RoundedRectangle(cornerRadius: 14)
                                      .stroke(Color(.systemIndigo), lineWidth: 2)
                              )
                              .padding()
                          
                          TextField("Type some feature...", text: $feature2) //gets the text
                              .disableAutocorrection(true)
                              .padding()
                              .overlay(
                                  RoundedRectangle(cornerRadius: 14)
                                      .stroke(Color(.systemIndigo), lineWidth: 2)
                              )
                              .padding()
                          
                          TextField("Type some feature...", text: $feature3) //gets the text
                              .disableAutocorrection(true)
                              .padding()
                              .overlay(
                                  RoundedRectangle(cornerRadius: 14)
                                      .stroke(Color(.systemIndigo), lineWidth: 2)
                              )
                              .padding()
                                
                                Spacer()
                          
                          if feature1=="" && feature2=="" && feature3==""{
                              Text("Done")
                                        .padding(.vertical)
                                        .frame( maxWidth: .infinity)
                                        .foregroundColor(Color.white)
                                        .background(Color(.systemIndigo)).cornerRadius(14)
                                        .padding(.horizontal)
                                        .opacity(0.5)
                          }
                                
                          else {
                              Button(action: {
                                  self.rootIsActive = false
                                  self.isCompleted = true
                              }, label: {
                                        Text("Done")
                                                  .padding(.vertical)
                                                  .frame( maxWidth: .infinity)
                                                  .foregroundColor(Color.white)
                                                  .background(Color(.systemIndigo)).cornerRadius(14)
                                                  .padding(.horizontal)
                              })
                                }
                                
                      }//VStack
                      .navigationTitle("Self Esteem")
                      .padding(.bottom)
                      
                      .toolbar{
                                
                                Button{
                                     self.rootIsActive = false                                } label: {
                                          Text("Cancel")
                                                    .foregroundColor(Color(.systemIndigo))
                                }
                                
                      }//Toolbar
                      
//            }//navigationView
}
}

