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
    
   
    let icon = ["lungs", "heart.text.square", "eyes", "figure.wave"]
    let exercise = ["Breathing", "Relationship Caring", "Eye Contact", "SelfEsteem"]
    var isCompleted = ["Completed", "Completed", "Not Completed", "Not Completed"]
    let destinations: [AnyView] = [AnyView(BreathingView()), AnyView(RelationshipCaring()), AnyView(TodayView()), AnyView(SelfEsteem())]
   
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Exercises")) {
                    ForEach(destinations.indices) { i in
                        TrainingListItem(icon: icon[i], exercise: exercise[i], isCompleted: isCompleted[i], destination: destinations[i])
                    }
                    
//                    TrainingListItem(icon: "lungs", exercise: "Breathing", isCompleted: "Completed", destination: BreathingView())
//
//                    TrainingListItem(icon: "heart.text.square", exercise: "Relationship Caring", isCompleted: "Completed", destination: BreathingView())
//                    TrainingListItem(icon: "eyes", exercise: "Eye Contact", isCompleted: "Completed", destination: BreathingView())
//                    TrainingListItem(icon: "aqi.medium", exercise: "Guided meditation", isCompleted: "Completed", destination: BreathingView())
//                    TrainingListItem(icon: "figure.wave", exercise: "Self Esteem", isCompleted: "Completed", destination: BreathingView())
//                    TrainingListItem(icon: "lungs", exercise: "Traffic Light", isCompleted: "Completed", destination: BreathingView())
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
