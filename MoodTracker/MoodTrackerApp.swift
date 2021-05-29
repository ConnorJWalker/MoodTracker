//
//  MoodTrackerApp.swift
//  MoodTracker
//
//  Created by Connor Walker on 29/05/2021.
//

import SwiftUI

@main
struct MoodTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
