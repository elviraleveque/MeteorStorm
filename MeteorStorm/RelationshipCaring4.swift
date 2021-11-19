//
//  RelationshipCaring4.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 16/11/21.
//
import SwiftUI
import Foundation

struct RelationshipCaring4: View {
    
    @Binding var rootIsActive : Bool
    @Binding var isCompleted : Bool


    
    @Binding var feature1: String
    @Binding var feature2: String
    @Binding var feature3: String
    
    @Binding var name: String
    
          var body: some View {

                              VStack{
                                        Spacer()
                                        Image(systemName: "bubble.right")
                                                  .resizable(resizingMode: .tile)
                                                  .aspectRatio(contentMode: .fit)
                                                  .foregroundColor(Color(.systemIndigo))
                                                  .frame(width: 123, height: 86)
                                        
                                  if feature1 == "" || feature2 == "" || feature3 == ""{
                                      VStack(alignment: .leading){
                                      Text("It seems you had trouble listing \(name)'s features.")
                                                .padding()
                                      
                                      Text("Maybe you should try paying more attention to them.")
                                          .padding(.horizontal)
                                      
                                      Text("Come back and redo the exercise when you feel like doing it.")
                                                .padding()
                                      }
                                      
                                  }
                                  else{
                                      VStack(alignment: .leading){
                                      Text("Well done!")
                                          .padding()
                                      
                                      Text("Paying attention to your surroundings is crucial.")
                                          .padding(.horizontal)
                                      
                                      Text("Keep practicing!")
                                          .padding()
                                      }

                                  }
                                
                                        Spacer()
                                        
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
                                        
                              }//VStack
                              .navigationTitle("Relationship Caring")
                              .padding(.bottom)
                              
                              .toolbar{
                                        
                                  Button{
                                       self.rootIsActive = false                                } label: {
                                            Text("Cancel")
                                                      .foregroundColor(Color(.systemIndigo))
                                  }
                                        
                              }//Toolbar
                              

          }
}

struct RelationshipCaring4_Previews: PreviewProvider {
    static var previews: some View {
        RelationshipCaring4(rootIsActive: .constant(true), isCompleted: .constant(true),feature1: .constant(""), feature2: .constant(""), feature3: .constant(""), name: .constant("Titina"))
    }
}

