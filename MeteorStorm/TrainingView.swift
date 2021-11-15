//
//  TrainingView.swift
//  MeteorStorm
//
//  Created by Vincenzo Pascarella on 14/11/21.
//

import SwiftUI

struct TrainingListItem: View {
    var icon: String = "person"
    var exercise: String
    var isCompleted: String
    
    var body: some View {
        HStack {
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
            .padding(.horizontal)

            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color(.systemIndigo))
        }
    }
}

struct TrainingView: View {
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Exercises")) {
                    TrainingListItem(icon: "lungs", exercise: "Breathing", isCompleted: "Completed")
                    TrainingListItem(icon: "heart.text.square", exercise: "Relationship Caring", isCompleted: "Completed")
                    TrainingListItem(icon: "eyes", exercise: "Eye Contact", isCompleted: "Completed")
                    TrainingListItem(icon: "aqi.medium", exercise: "Guided meditation", isCompleted: "Completed")
                    TrainingListItem(icon: "figure.wave", exercise: "Self Esteem", isCompleted: "Completed")
                    TrainingListItem(icon: "lungs", exercise: "Traffic Light", isCompleted: "Completed")
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
