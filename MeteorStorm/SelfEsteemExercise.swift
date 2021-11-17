//
//  SelfEsteemExercise.swift
//  MeteorStorm
//
//  Created by Fabiana Ferrara on 17/11/21.
//

import SwiftUI
import Foundation

struct SelfEsteemExercise: View {
    
    @State private var valueOne: String = ""
    @State private var valueTwo: String = ""
    @State private var valueThree: String = ""
    
    
        var body: some View {
//            NavigationView {
                      VStack{
                          Spacer()
                                Text("What do you like about yourself?")
                                    .font(.system(size: 34, weight: .regular, design: .default))
                                    .foregroundColor(Color.primary)
                                    .padding()
                          
                                Text("List down three traits of you personality that you like")
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 17, weight: .regular, design: .default))
                                    .foregroundColor(Color(.systemGray))
                                    .padding()
                          
                          TextField("Type some feature...", text: $valueOne) //gets the text
                              .disableAutocorrection(true)
                              .padding()
                              .overlay(
                                  RoundedRectangle(cornerRadius: 14)
                                      .stroke(Color(.systemIndigo), lineWidth: 2)
                              )
                              .padding()
                          
                          TextField("Type some feature...", text: $valueTwo) //gets the text
                              .disableAutocorrection(true)
                              .padding()
                              .overlay(
                                  RoundedRectangle(cornerRadius: 14)
                                      .stroke(Color(.systemIndigo), lineWidth: 2)
                              )
                              .padding()
                          
                          TextField("Type some feature...", text: $valueThree) //gets the text
                              .disableAutocorrection(true)
                              .padding()
                              .overlay(
                                  RoundedRectangle(cornerRadius: 14)
                                      .stroke(Color(.systemIndigo), lineWidth: 2)
                              )
                              .padding()
                                
                                Spacer()
                                
                          NavigationLink(destination: TrainingView()) {
                                          Text("Done")
                                                    .padding(.vertical)
                                                    .frame( maxWidth: .infinity)
                                                    .foregroundColor(Color.white)
                                                    .background(Color(.systemIndigo)).cornerRadius(14)
                                                    .padding(.horizontal)
                                }
                                
                      }//VStack
//                      .navigationTitle("SelfEsteem")
//                      .padding(.bottom)
//                      
//                      .toolbar{
//                                
//                                Button{
//                                          //Place the action that the button performs
//                                } label: {
//                                          Image(systemName: "xmark.circle")
//                                                    .foregroundColor(Color(.systemIndigo))
//                                }
//                                
//                      }//Toolbar
                      
//            }//navigationView
}
}
struct SelfEsteemExercise_Previews: PreviewProvider {
    static var previews: some View {
        SelfEsteemExercise()
    }
}
