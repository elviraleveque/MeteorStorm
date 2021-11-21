//
//  TrafficLight2.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 17/11/21.
//

import SwiftUI



struct TrafficLight2: View {
    @Binding var rootIsActive : Bool
    @Binding var isCompleted : Bool
    
    @State var isVisible = false
    @State var currentDate = Date()
    @State var isActive = true
    
    @State var timeRemaining = [10, 6, 7]
    @State var emotions = ["","",""]
    @State var thoughts = ["","",""]
    
    @State var empty = false
    
    @State var redLight = false
    @State var yellowLight = false
    @State var greenLight = false
    @State var offLight = false


    var body: some View {
        
        VStack{
            if !(redLight || yellowLight || greenLight || offLight){
                Text("Stay focused,\nrelax yourself and\nlet's start!")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color.primary)
                    .animation(.none)
                    .padding(.horizontal)
                
                Light(color: Color.primary, duration: 2, count: $redLight, notCount: .constant(false))
                    .opacity(0)
                
            }
            
            else if redLight{
                
                Light(color: Color(.systemRed), duration: 3, count: $yellowLight, notCount: $redLight)
                    .padding()
                
                
                Text("Topic:")
                    .font(.largeTitle).fontWeight(.bold).padding()
                    .animation(.none)
                
                Text("Family")
                    .font(.system(size: 34, weight: .regular, design: .default))
                    .foregroundColor(Color.primary)
                    .animation(.none)
                
                Text("Stop for some time and think about the provided topic")
                    .padding()
                    .font(.title)
                
                
                Spacer()
                
                
            }
            else if yellowLight{
                
                let hasWrited = (emotions[0] != "" || emotions[1] != "" || emotions[2] != "")
                
                Light(color: Color(.systemYellow), duration: 3, count: $greenLight, notCount: .constant(false))
                    .padding()
                
                
                Text("Emotions:")
                    .font(.largeTitle).fontWeight(.bold).padding(.horizontal)
                
                TextField("What do you feel?", text: $emotions[0]) //gets the text
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color(.systemYellow), lineWidth: 2)
                    )
                    .padding(.horizontal)
                    .padding(.bottom)
                
                TextField("What do you feel?", text: $emotions[1]) //gets the text
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color(.systemYellow), lineWidth: 2)
                    )
                    .padding(.horizontal)
                    .padding(.bottom)
                
                TextField("What do you feel?", text: $emotions[2]) //gets the text
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color(.systemYellow), lineWidth: 2)
                    )
                    .padding(.horizontal)
                    .padding(.bottom)
                
                Spacer()
                
                
                Text(hasWrited ? "If you are ready go forward" : "Continue to think and write something")
                    .foregroundColor(Color(.systemGray))
                    .opacity(greenLight ? 1 : 0)
                    .padding(.horizontal)
                
                if hasWrited{
                    Button{
                        yellowLight = false
                    } label: {
                        
                        Text("Continue")
                            .padding(.vertical)
                            .frame( maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            .background(Color(.systemIndigo)).cornerRadius(14)
                            .padding(.horizontal)
                            .padding(.bottom)
                            .opacity(greenLight ? 1 : 0)
                        
                    }
                } else {
                    Text("Continue")
                        .padding(.vertical)
                        .frame( maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(Color(.systemIndigo)).cornerRadius(14)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .opacity(greenLight ? 0.5 : 0)
                }
                
                Spacer()
                
                
            }
            else if (greenLight && !yellowLight){
                
                let hasWrited = (thoughts[0] != "" || thoughts[1] != "" || thoughts[2] != "")
                
                Light(color: Color(.systemGreen), duration: 3, count: $offLight, notCount: .constant(false))
                    .padding()
                
                Text("Thoughts:")
                    .font(.largeTitle).fontWeight(.bold).padding(.horizontal)
                
                
                TextField(emotions[0] != "" ? "Why \(emotions[0])?" : "Add some thoughts", text: $thoughts[0]) //gets the text
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color(.systemGreen), lineWidth: 2)
                    )
                    .padding(.horizontal)
                    .padding(.bottom)
                
                
                TextField(emotions[1] != "" ? "Why \(emotions[1])?" : "Add some thoughts", text: $thoughts[1]) //gets the text
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color(.systemGreen), lineWidth: 2)
                    )
                    .padding(.horizontal)
                    .padding(.bottom)
                
                
                
                TextField(emotions[2] != "" ? "Why \(emotions[2])?" : "Add some thoughts", text: $thoughts[2]) //gets the text
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color(.systemGreen), lineWidth: 2)
                    )
                    .padding(.horizontal)
                    .padding(.bottom)
                Spacer()
                
                
                Text(hasWrited ? "If you are ready click done" : "Continue to think and write something")
                    .foregroundColor(Color(.systemGray))
                    .opacity(offLight ? 1 : 0)
                    .padding(.horizontal)
                
                if hasWrited{
                    Button{
                        greenLight = false
                    } label: {
                        
                        Text("Done")
                            .padding(.vertical)
                            .frame( maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            .background(Color(.systemIndigo)).cornerRadius(14)
                            .padding(.horizontal)
                            .padding(.bottom)
                            .opacity(offLight ? 1 : 0)
                        
                    }
                } else {
                    Text("Done")
                        .padding(.vertical)
                        .frame( maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(Color(.systemIndigo)).cornerRadius(14)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .opacity(offLight ? 0.5 : 0)
                }
                
                Spacer()
                
                
                
            }
            else if offLight{
                TrafficLight3(rootIsActive: self.$rootIsActive, isCompleted: self.$isCompleted)
                
            }
            
        }//Vstack
        .toolbar{
            
            Button{
                self.rootIsActive = false                                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemIndigo))
                }
            
        }//Toolbar
        
    }
    
}


struct TrafficLight2_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TrafficLight2(rootIsActive: .constant(false), isCompleted: .constant(false))
                .preferredColorScheme(.light)
        }
    }
}
