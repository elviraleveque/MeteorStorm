//
//  TrainingView.swift
//  MeteorStorm
//
//  Created by Vincenzo Pascarella on 14/11/21.
//

import SwiftUI

struct TrainingListItem<Destination: View>: View {
    
    var icon: Image
    var exercise: String
    var isCompleted: Bool
    var destination: Destination
    @Binding var isActive : Bool
    
    var body: some View {
        HStack {
            NavigationLink(destination: destination,isActive: self.$isActive, label: {
                icon
                    .scaleEffect(icon == Image("traffic Light") ? 0.2 : 1)
                    .foregroundColor(Color(.systemIndigo))
                    .frame(width: 25, height: 50)

                VStack (alignment: .leading){
                    Text(exercise)
                        .font(.headline)
                    Text(isCompleted ? "Completed" : "Not completed")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
            })
        }
    }
}

struct TrainingView: View {
    
    @State var isActive: [Bool] = [false, false, false, false, false]
    @State var completed: [Bool] = [false, false, false, false, false]

   
    var body: some View {
        NavigationView {
            List{
                
                
                Section(header: Text("Exercises")) {
                    
                    TrainingListItem(icon: Image(systemName: "lungs"), exercise: "Breathing", isCompleted: completed[0], destination: BreathingView(rootIsActive: self.$isActive[0], isCompleted: self.$completed[0]), isActive: $isActive[0])

                    TrainingListItem(icon: Image(systemName: "heart.text.square"), exercise: "Relationship Caring", isCompleted: completed[1], destination: RelationshipCaring(rootIsActive: self.$isActive[1], isCompleted: self.$completed[1]), isActive: $isActive[1])
                    
                    TrainingListItem(icon: Image(systemName: "figure.wave"), exercise: "Self Esteem", isCompleted: completed[2], destination: SelfEsteemView(rootIsActive: self.$isActive[2], isCompleted: self.$completed[2]), isActive: $isActive[2])
                    
                    TrainingListItem(icon: Image(systemName: "aqi.medium"), exercise: "Guided Meditation", isCompleted: completed[3], destination: GuidedMeditation(rootIsActive: self.$isActive[3], isCompleted: self.$completed[3]), isActive: $isActive[3])
                    
                    TrainingListItem(icon: Image("traffic Light"), exercise: "Traffic Light", isCompleted: completed[4], destination: TrafficLight(rootIsActive: self.$isActive[4], isCompleted: self.$completed[4]), isActive: $isActive[4])

                    
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
