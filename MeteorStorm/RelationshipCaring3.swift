//
//  RelationshipCaring3.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 16/11/21.
//

import SwiftUI

struct RelationshipCaring3: View {
    @Binding var rootIsActive : Bool
    @Binding var isCompleted : Bool


    @State private var feature1: String = ""
    @State private var feature2: String = ""
    @State private var feature3: String = ""
    
    @Binding var name: String
    
        var body: some View {
//            NavigationView {
                      VStack{
                          Spacer()
                                Text("What do you know about that person?")
                                    .font(.system(size: 34, weight: .regular, design: .default))
                                    .foregroundColor(Color.primary)
                                    .padding()
                          
                                Text("List down some traits, hobbies, features.\n You can leave it blank if you have troubles with it.")
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 17, weight: .regular, design: .default))
                                    .foregroundColor(Color(.systemGray))
                          
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
                                
                          NavigationLink(destination: RelationshipCaring4(rootIsActive: self.$rootIsActive, isCompleted: self.$isCompleted, feature1: self.$feature1, feature2: self.$feature2, feature3: self.$feature3, name: self.$name)) {
                                          Text("Continue")
                                                    .padding(.vertical)
                                                    .frame( maxWidth: .infinity)
                                                    .foregroundColor(Color.white)
                                                    .background(Color(.systemIndigo)).cornerRadius(14)
                                                    .padding(.horizontal)
                                }
                          .isDetailLink(false)
                                
                      }//VStack
                      .navigationTitle("Relationship Caring")
                      .padding(.bottom)
                      .onTapGesture{
                          hideKeyboard()
                      }
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

struct RelationshipCaring3_Previews: PreviewProvider {
    static var previews: some View {
        RelationshipCaring3(rootIsActive: .constant(true), isCompleted: .constant(true), name: .constant(""))
    }
}

