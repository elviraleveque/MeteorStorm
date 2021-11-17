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
    @Binding var isActive : Bool
    
    var body: some View {
        HStack {
            NavigationLink(destination: destination,isActive: self.$isActive, label: {
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
    
    @State var isActive: [Bool] = [false, false, false]
   
    var body: some View {
        NavigationView {
            List{
                
                
                Section(header: Text("Exercises")) {
                    
                    TrainingListItem(icon: "lungs", exercise: "Breathing", isCompleted: "Completed", destination: BreathingView(rootIsActive: self.$isActive[0]), isActive: $isActive[0])

                    TrainingListItem(icon: "heart.text.square", exercise: "Relationship Caring", isCompleted: "Completed", destination: RelationshipCaring(rootIsActive: self.$isActive[1]), isActive: $isActive[1])
                    
                    TrainingListItem(icon: "heart.text.square", exercise: "Relationship Caring", isCompleted: "Completed", destination: RelationshipCaring(rootIsActive: self.$isActive[1]), isActive: $isActive[1])

                    
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Training")
        }
    }
}

//struct TrainingView_Previews: PreviewProvider {
//    static var previews: some View {
//        TrainingView(isActive: .constant)
//    }
//}
