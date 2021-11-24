//
//  RelationshipCaring.swift
//  MeteorStorm
//
//  Created by Vincenzo Pascarella on 16/11/21.
//

import SwiftUI
import Foundation



struct SelfEsteemView: View {
    
    @Binding var rootIsActive : Bool
    @Binding var isCompleted : Bool

    
    
    var body: some View {
        NavigationView{
        VStack{
            Spacer()
            Image(systemName: "figure.wave")
                .resizable(resizingMode: .tile)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color(.systemIndigo))
                .frame(width: 123, height: 86)
            
            
            VStack(alignment: .leading){
                Text("You are beautiful because you are unique.")
                
                    .padding()
                
                Text("Look inside and outside at your personality,  then write down some things that you like about you.")
                    .padding(.horizontal)
            }
            
            Spacer()
            
            Text("Ready?").font(.largeTitle).fontWeight(.bold).padding()
            
            NavigationLink(destination: SelfEsteemExercise(rootIsActive: self.$rootIsActive, isCompleted: self.$isCompleted)) {
                Text("Start")
                    .padding(.vertical)
                    .frame( maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color(.systemIndigo)).cornerRadius(14)
                    .padding(.horizontal)
            }
            .isDetailLink(false)
//
            
        }//VStack
        .navigationTitle("Self Esteem")
        .padding(.bottom)
        .toolbar{
                  
                  Button{
                       self.rootIsActive = false                                } label: {
                            Text("Close")
                                      .foregroundColor(Color(.systemIndigo))
                  }
                  
        }//Toolbar
        }
        
        .accentColor(Color(.systemIndigo))

    }
}

