//
//  FireLearnApp.swift
//  FireLearn
//
//  Created by Apprenant 160 on 03/06/2024.
//

import SwiftUI
import SwiftData

@main
struct FireLearnApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            //ModuleListView()
           TamagoDragonView()
        }
        .modelContainer(sharedModelContainer)
    }
}
