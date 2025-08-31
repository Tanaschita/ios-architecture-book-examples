//
//  SettingsRootView.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 31.08.25.
//

import SwiftUI

struct SettingsRootView: View {
    @Binding var router: SettingsRouter

    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            SettingsView(router: $router)
                .navigationDestination(for: SettingsRouter.Route.self) { route in
                    switch route {
                    case .profile:
                        Text("Profile view")
                    case .preferences:
                        Text("Preferences view")
                    case .about:
                        Text("About view")
                    }
                }
        }
    }
}
