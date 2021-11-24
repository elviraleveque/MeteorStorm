//
//  TrainingView.swift
//  MeteorStorm
//
//  Created by Vincenzo Pascarella on 14/11/21.
//

import SwiftUI

struct TrainingListItem: View {
    
    var icon: Image
    var exercise: String
    var isCompleted: Bool
    @Binding var isActive : Bool
    
    var body: some View {
        HStack {
            Button{
                isActive.toggle()
            } label: {
                HStack{
                    icon
                        .scaleEffect(icon == Image("traffic Light") ? 0.2 : 1)
                        .foregroundColor(Color(.systemIndigo))
                        .frame(width: 25, height: 50)
                    
                    VStack (alignment: .leading){
                        Text(exercise)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text(isCompleted ? "Completed" : "Not completed")
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
            }
            
            
        }
    }
}

struct TrainingView: View {
    
    @State var isActive: [Bool] = [false, false, false, false, false]
    @State var completed: [Bool] = [false, false, false, false, false]
    //    init() {
    //        UITableView.appearance().backgroundColor = UIColor.systemBackground
    //    }
    
    
    var body: some View {
        NavigationView {
            List{
                
                
                Section(header: Text("Exercises")) {
                    
                    TrainingListItem(icon: Image(systemName: "lungs"), exercise: "Breathing", isCompleted: completed[0], isActive: $isActive[0])
                        .sheet(isPresented: $isActive[0]){
                            BreathingView(rootIsActive: self.$isActive[0], isCompleted: self.$completed[0])
                        }
                    
                    
                    TrainingListItem(icon: Image(systemName: "heart.text.square"), exercise: "Relationship Caring", isCompleted: completed[1],isActive: $isActive[1])
                        .sheet(isPresented: $isActive[1]){
                            RelationshipCaring(rootIsActive: self.$isActive[1], isCompleted: self.$completed[1])
                        }
                    
                    TrainingListItem(icon: Image(systemName: "figure.wave"), exercise: "Self Esteem", isCompleted: completed[2], isActive: $isActive[2])
                        .sheet(isPresented: $isActive[2]){
                            SelfEsteemView(rootIsActive: self.$isActive[2], isCompleted: self.$completed[2])
                        }
                    
                    TrainingListItem(icon: Image(systemName: "aqi.medium"), exercise: "Guided Meditation", isCompleted: completed[3], isActive: $isActive[3])
                        .sheet(isPresented: $isActive[3]){
                            GuidedMeditation(rootIsActive: self.$isActive[3], isCompleted: self.$completed[3])
                        }
                    
                    TrainingListItem(icon: Image("traffic Light"), exercise: "Traffic Light", isCompleted: completed[4], isActive: $isActive[4])
                        .sheet(isPresented: $isActive[4]){
                            TrafficLight(rootIsActive: self.$isActive[4], isCompleted: self.$completed[4])
                        }
                    
                    
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Training")
        }
    }
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView()
    }
}
