//
//  ExampleAppApp.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 09.07.26.
//

import SwiftUI
import SwiftData

@main
struct ExampleApp: App {
    var modelContainer: ModelContainer = {
        let schema = Schema([PersistedItem.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ItemListView(
                repository: ItemRepositoryImpl(
                    modelContext: modelContainer.mainContext
                )
            )
        }
    }
}
