//
//  RelationshipCaring4.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 16/11/21.
//
import SwiftUI
import Foundation

struct RelationshipCaring4: View {
    
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
                                      
                                      Text("It seems you had trouble listing \(name)'s features.")
                                                .padding(.vertical)
                                      
                                      Text("Maybe you should try paying more attention to them.")
                                                .padding(.vertical)
                                                .multilineTextAlignment(.center)
                                      
                                      Text("Come back and redo the exercise when you feel like doing it.")
                                                .padding(.vertical)
                                                .multilineTextAlignment(.center)
                                      
                                  }
                                  else{
                                      Text("Well done!")
                                          .padding(.vertical)
                                          .multilineTextAlignment(.center)
                                      
                                      Text("Paying attention to your surroundings is crucial.")
                                          .padding(.vertical)
                                          .multilineTextAlignment(.center)
                                      
                                      Text("Keep practicing!")
                                          .padding(.vertical)
                                          .multilineTextAlignment(.center)

                                  }
                                
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
                              .navigationTitle("Relationship Caring")
                              .padding(.bottom)
                              
                              .toolbar{
                                        
                                        Button{
                                                  //Place the action that the button performs
                                        } label: {
                                                  Image(systemName: "gearshape")
                                                            .foregroundColor(Color(.systemIndigo))
                                        }
                                        
                              }//Toolbar
                              

          }
}

struct RelationshipCaring4_Previews: PreviewProvider {
    static var previews: some View {
        RelationshipCaring4(feature1: .constant(""), feature2: .constant(""), feature3: .constant(""), name: .constant("Titina"))
    }
}

