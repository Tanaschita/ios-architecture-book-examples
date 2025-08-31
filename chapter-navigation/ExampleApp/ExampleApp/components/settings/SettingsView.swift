//
//  SettingsView.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 31.08.25.
//

import SwiftUI

struct SettingsView: View {
    @Binding var router: SettingsRouter

    var body: some View {
        List {
            Section("User") {
                Button("Profile") {
                    router.navigate(to: .profile)
                }
                .foregroundColor(.primary)
            }
            
            Section("App") {
                Button("Preferences") {
                    router.navigate(to: .preferences)
                }
                .foregroundColor(.primary)
                
                Button("About") {
                    router.navigate(to: .about)
                }
                .foregroundColor(.primary)
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
    }
}
