//
//  TabBarView.swift
//  MeteorStorm esercizio
//
//  Created by Vincenzo Pascarella on 14/11/21.
//

import SwiftUI

struct TabBarView: View{
    var body: some View{
        TabView{
            TodayView()
                .tabItem{
                    Label("Today", systemImage: "sun.max")
                }
            
            CalendarView()
                .tabItem{
                    Label("Calendar", systemImage: "calendar")
                }
            
            TrainingView()
                .tabItem{
                    Label("Training", systemImage: "brain")
                }

        }
        .accentColor(Color(.systemIndigo))
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView()
                .preferredColorScheme(.light)
                .preferredColorScheme(.dark)
        }
    }
}

