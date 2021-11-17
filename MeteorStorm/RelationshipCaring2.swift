//
//  RelationshipCaring2.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 16/11/21.
//

import SwiftUI

struct RelationshipCaring2: View {
    @Binding var rootIsActive : Bool

    
    @State private var name: String = ""
    
    var body: some View {
                  VStack{
                      Spacer()
                            Text("Think of a person you interacted with today")
                                .font(.system(size: 34, weight: .regular, design: .default))
                                .foregroundColor(Color.primary)
                                .padding()
                      
                            Text("Type down their name")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 17, weight: .regular, design: .default))
                                .foregroundColor(Color(.systemGray))
                      
                      TextField("Name:", text: $name) //gets the text
                          .disableAutocorrection(true)
                          .padding()
                          .overlay(
                              RoundedRectangle(cornerRadius: 14)
                                  .stroke(Color(.systemIndigo), lineWidth: 2)
                          )
                          .padding()
                            
                            Spacer()
                            
                      NavigationLink(destination: RelationshipCaring3(rootIsActive: self.$rootIsActive, name: self.$name)) {
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
                  
                  .toolbar{
                            
                            Button{
                                 self.rootIsActive = false                            } label: {
                                      Image(systemName: "xmark.circle")
                                                .foregroundColor(Color(.systemIndigo))
                            }
                            
                  }//Toolbar
                  
        }
}



struct RelationshipCaring2_Previews: PreviewProvider {
    static var previews: some View {
        RelationshipCaring2(rootIsActive: .constant(true))
    }
}
