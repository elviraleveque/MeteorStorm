//
//  RelationshipCaring.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 16/11/21.
//

import SwiftUI
import Foundation



struct RelationshipCaring: View {
          var body: some View {

                              VStack{
                                        Spacer()
                                        Image(systemName: "heart.text.square")
                                                  .resizable(resizingMode: .tile)
                                                  .aspectRatio(contentMode: .fit)
                                                  .foregroundColor(Color(.systemIndigo))
                                                  .frame(width: 123, height: 86)
                                        
                                        
                                        
                                        Text("Think of a person you interacted with today")
                                        
                                                  .padding(.vertical)
                                        
                                        Text("Try to write down some traits or habits you noticed:\n being aware of this kind of details is important to strenghten your social awareness.")
                                     
                                      .multilineTextAlignment(.center)
                                
                                        Spacer()
                                        
                                        Text("Ready?").font(.largeTitle).fontWeight(.bold).padding()
                                        
                                        NavigationLink(destination: RelationshipCaring2()) {
                                                  Text("Start")
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
    
struct RelationshipCaring_Previews: PreviewProvider {
    static var previews: some View {
        RelationshipCaring()
    }
}
