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
    @State var keyboard = false


    
        var body: some View {
//            NavigationView {
            VStack(alignment: .leading){
                          Spacer()
                                Text("What do you like about yourself?")
                                    .font(.system(size: 34, weight: .regular, design: .default))
                                    .minimumScaleFactor(keyboard ? 0.6 : 1)
                                    .foregroundColor(Color.primary)
                                    .padding(.bottom)
                                    .padding(.horizontal)
                
                                Text("List down three traits of you personality that you like")
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
                      .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
                          keyboard = true
                      }.onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                          keyboard = false
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

