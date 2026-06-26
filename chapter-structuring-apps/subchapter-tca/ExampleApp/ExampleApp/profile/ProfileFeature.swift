//
//  ProfileFeature.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 26.06.26.
//

import ComposableArchitecture

@Reducer
struct ProfileFeature {
    @ObservableState
    struct State: Equatable {
        var displayName = "tanaschita@gmail.com"
        var favoriteTopic = "Architecture & Design Patterns"
    }

    enum Action {
        case appeared
    }

    var body: some Reducer<State, Action> {
        Reduce { _, action in
            switch action {
            case .appeared:
                return .none
            }
        }
    }
}
