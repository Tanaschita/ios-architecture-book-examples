//
//  AppFeature.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 26.06.26.
//

import ComposableArchitecture

struct AppFeature: Reducer {
    @ObservableState
    struct State: Equatable {
        var news = NewsFeature.State()
        var profile = ProfileFeature.State()
    }

    @CasePathable
    enum Action {
        case news(NewsFeature.Action)
        case profile(ProfileFeature.Action)
    }

    var body: some Reducer<State, Action> {
        Scope(state: \.news, action: \.news) {
            NewsFeature()
        }
        Scope(state: \.profile, action: \.profile) {
            ProfileFeature()
        }
    }
}
