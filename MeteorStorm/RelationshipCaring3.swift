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
    @State var keyboard = false

    @Binding var name: String
    
        var body: some View {
//            NavigationView {
            VStack(alignment: .leading){
                          Spacer()
                                Text("What do you know about that person?")
                                    .font(.system(size: 34, weight: .regular, design: .default))
                                    .minimumScaleFactor(keyboard ? 0.6 : 1)
                                    .foregroundColor(Color.primary)
                                    .padding(.bottom)
                                    .padding(.horizontal)
                          
                                Text("List down some traits, hobbies, features. You can leave it blank if you have troubles with it.")
                                    .font(.system(size: 17, weight: .regular, design: .default))
                                    .minimumScaleFactor(keyboard ? 0.7 : 1)
                                    .foregroundColor(Color(.systemGray))
                                    .padding(.bottom)
                                    .padding(.horizontal)
                          
                          TextField("Type some feature...", text: $feature1) //gets the text
                              .disableAutocorrection(true)
                              .padding()
                              .overlay(
                                  RoundedRectangle(cornerRadius: 14)
                                      .stroke(Color(.systemIndigo), lineWidth: 2)
                              )
                              .padding(.horizontal)
                          
                          TextField("Type some feature...", text: $feature2) //gets the text
                              .disableAutocorrection(true)
                              .padding()
                              .overlay(
                                  RoundedRectangle(cornerRadius: 14)
                                      .stroke(Color(.systemIndigo), lineWidth: 2)
                              )
                              .padding(.top)
                              .padding(.horizontal)
                          
                          TextField("Type some feature...", text: $feature3) //gets the text
                              .disableAutocorrection(true)
                              .padding()
                              .overlay(
                                  RoundedRectangle(cornerRadius: 14)
                                      .stroke(Color(.systemIndigo), lineWidth: 2)
                              )
                              .padding(.top)
                              .padding(.horizontal)
                          
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
                      .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
                          keyboard = true
                      }.onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                          keyboard = false
                      }
                      .toolbar{
                                
                                Button{
                                     self.rootIsActive = false                                } label: {
                                          Text("Close")
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

