//
//  SelfEsteemView.swift
//  MeteorStorm
//
//  Created by Fabiana Ferrara on 17/11/21.
//
import SwiftUI
import Foundation


struct SelfEsteem: View {
          var body: some View {
                    VStack{
                              Spacer()
                              Image(systemName: "figure.wave")
                                        .resizable(resizingMode: .tile)
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(Color(.systemIndigo))
                                        .frame(width: 123, height: 86)
                              
                              
                        HStack{
                        Text("You are beautiful because you are unique.")
                                .padding()
                            Spacer()
                        }
                        Text("Look inside and outside at your personality, then write down some things that you like about you.")
                            .multilineTextAlignment(.leading)
                            .padding()
                              
                              Spacer()
                              
                              Text("Ready?").font(.largeTitle).fontWeight(.bold).padding()
                              
                              NavigationLink(destination: SelfEsteemExercise()) {
                                        Text("Start")
                                                  .padding(.vertical)
                                                  .frame( maxWidth: .infinity)
                                                  .foregroundColor(Color.white)
                                                  .background(Color(.systemIndigo)).cornerRadius(14)
                                                  .padding(.horizontal)
                              }
                              
                    }//VStack
                    .navigationTitle("Self Esteem")
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

struct SelfEsteem_Previews: PreviewProvider {
          static var previews: some View {
                    Group {
                              SelfEsteem()
                                        .preferredColorScheme(.light)
                              SelfEsteem()
                                        .preferredColorScheme(.dark)
                    }
          }
}
