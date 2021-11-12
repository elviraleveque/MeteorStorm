//
//  MeteorStormApp.swift
//  MeteorStorm
//
//  Created by Elvira Leveque on 12/11/21.
//

import SwiftUI

@main
struct MeteorStormApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
