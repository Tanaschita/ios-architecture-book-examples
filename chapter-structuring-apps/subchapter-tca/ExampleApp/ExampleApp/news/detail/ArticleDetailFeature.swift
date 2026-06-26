//
//  ArticleDetailFeature.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 26.06.26.
//

import ComposableArchitecture

@Reducer
struct ArticleDetailFeature {
    @ObservableState
    struct State: Equatable {
        let article: Article
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
