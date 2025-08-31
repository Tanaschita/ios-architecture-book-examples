//
//  ExampleAppApp.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 31.08.25.
//

import SwiftUI

@main
struct ExampleAppApp: App {
    @State private var appRouter = AppRouter()

    var body: some Scene {
        WindowGroup {
            TabView(selection: $appRouter.selectedTab) {
                SearchRootView(router: $appRouter.searchRouter)
                    .tabItem {
                        Label(Tab.search.title, systemImage: Tab.search.icon)
                    }
                    .tag(Tab.search.rawValue)

                SettingsRootView(router: $appRouter.settingsRouter)
                    .tabItem {
                        Label(Tab.settings.title, systemImage: Tab.settings.icon)
                    }
                    .tag(Tab.settings.rawValue)
            }
        }
    }
}
