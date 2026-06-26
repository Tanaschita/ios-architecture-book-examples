//
//  ExampleAppApp.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 26.06.26.
//

import SwiftUI
import ComposableArchitecture

@main
struct ExampleAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(
                    initialState: AppFeature.State(),
                    reducer: { AppFeature() }
                )
            )
        }
    }
}
