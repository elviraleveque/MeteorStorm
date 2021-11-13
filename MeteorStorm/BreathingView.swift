//
//  BreathingView.swift
//  MeteorStorm
//
//  Created by Fabiana Ferrara on 13/11/21.
//
import SwiftUI
import Foundation

struct BreathingView: View {
    var body: some View {
        VStack{
            Image(systemName: "lungs")
                .resizable(resizingMode: .tile)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.purple)
                .frame(width: 123, height: 86)
                
            Text("Sit on a chair that supports your back, or lay on a yoga mat on the floor.")
            
            Text("Breath in through your nose and out through your mouth.")
            
                
        }
        
    }
}

struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BreathingView()
                .preferredColorScheme(.light)
            BreathingView()
                .preferredColorScheme(.dark)
        }
    }
}
