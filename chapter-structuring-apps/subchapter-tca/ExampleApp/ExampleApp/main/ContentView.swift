//
//  ContentView.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 26.06.26.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<AppFeature>

    var body: some View {
        TabView {
            NewsListView(
                store: store.scope(state: \.news, action: \.news)
            )
            .tabItem {
                Label("News", systemImage: "newspaper")
            }

            ProfileView(
                store: store.scope(state: \.profile, action: \.profile)
            )
            .tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        }
    }
}
