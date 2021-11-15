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
        NavigationView {
        VStack{
            Spacer()
            Image(systemName: "lungs")
                .resizable(resizingMode: .tile)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color(.systemIndigo))
                .frame(width: 123, height: 86)
           

            
            Text("Sit on a chair that supports your back or lay    \non a yoga  mat on the floor.")

                .padding(.vertical)
            
            Text("Breath in through your nose and out through your mouth.")
           
            Spacer()
            
            Text("Ready?").font(.largeTitle).fontWeight(.bold).padding()

            NavigationLink(destination: BreathingExercise()) {
                                Text("Start")
                    .padding(.vertical)
                                        .frame( maxWidth: .infinity)
                    
                                    .foregroundColor(Color.white)
                                    .background(Color(.systemIndigo)).cornerRadius(14)
                                    .padding(.horizontal)
                            }
                
            }//VStack
        .navigationTitle("Breathing")
        .padding(.bottom)
            
        .toolbar{
            
            Button{
              //Place the action that the button performs
            } label: {
                Image(systemName: "gearshape")
                    .foregroundColor(Color(.systemIndigo))
            }
            
        }//Toolbar
            
        }//navigationView
    }
}


struct BreathingExercise: View {
 @State private var isVisible = false
    
    var body: some View{
        NavigationView{
            VStack{
                Text("Inhale/Exhale")
                Spacer()
                ZStack {
                    Image("MovingCircle")
                        .scaleEffect(isVisible ? 1.5: 0.8)
                        .onAppear(perform: {
                            withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)){
                                self.isVisible.toggle()
                            }
                        })
                       
                    Image("StaticCircle")
                }
                Spacer()
            }
        }.navigationTitle("Breathing")
    }
}//view with the real exercise

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
