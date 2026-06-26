//
//  ProfileView.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 26.06.26.
//

import SwiftUI
import ComposableArchitecture

struct ProfileView: View {
    let store: StoreOf<ProfileFeature>

    var body: some View {
        NavigationStack {
            Form {
                Section("Reader") {
                    LabeledContent("Logged in as", value: store.displayName)
                    LabeledContent("Focus", value: store.favoriteTopic)
                }
            }
            .navigationTitle("Profile")
        }
    }
}
