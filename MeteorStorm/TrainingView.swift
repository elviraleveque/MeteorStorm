//
//  TrainingView.swift
//  MeteorStorm
//
//  Created by Vincenzo Pascarella on 14/11/21.
//

import SwiftUI

struct TrainingListItem<Destination: View>: View {
    
    var icon: String = "person"
    var exercise: String
    var isCompleted: String
        
    var destination: Destination
    
    var body: some View {
        HStack {
            NavigationLink(destination: destination, label: {
                Image(systemName: icon)
                    .foregroundColor(Color(.systemIndigo))
                    .frame(width: 25)
                VStack (alignment: .leading){
                    Text(exercise)
                        .font(.headline)
                    Text(isCompleted)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
            })
        }
    }
}

struct TrainingView: View {
    
    let destinations = []
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Exercises")) {
                    ForEach(destinations) {
                        TrainingListItem(icon: "lungs", exercise: "Breathing", isCompleted: "Completed", destination: BreathingView())
                    }
                    
                    TrainingListItem(icon: "lungs", exercise: "Breathing", isCompleted: "Completed", destination: BreathingView())
                    
                    TrainingListItem(icon: "heart.text.square", exercise: "Relationship Caring", isCompleted: "Completed", destination: BreathingView())
                    TrainingListItem(icon: "eyes", exercise: "Eye Contact", isCompleted: "Completed", destination: BreathingView())
                    TrainingListItem(icon: "aqi.medium", exercise: "Guided meditation", isCompleted: "Completed", destination: BreathingView())
                    TrainingListItem(icon: "figure.wave", exercise: "Self Esteem", isCompleted: "Completed", destination: BreathingView())
                    TrainingListItem(icon: "lungs", exercise: "Traffic Light", isCompleted: "Completed", destination: BreathingView())
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
