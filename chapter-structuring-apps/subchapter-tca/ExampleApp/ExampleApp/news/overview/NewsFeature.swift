//
//  NewsFeature.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 26.06.26.
//

import Foundation
import ComposableArchitecture

@Reducer
struct NewsFeature {
    @ObservableState
    struct State: Equatable {
        var articles: [Article] = []
        var isLoading = false
        var error: String?
        @Presents var articleDetail: ArticleDetailFeature.State?
    }

    enum Action {
        case onAppear
        case refreshButtonTapped
        case articleTapped(Article)
        case articlesResponse(Result<[Article], Error>)
        case articleDetail(PresentationAction<ArticleDetailFeature.Action>)
    }

    @Dependency(\.newsClient) var newsClient

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                guard state.articles.isEmpty else { return .none }
                return fetchArticles(state: &state)

            case .refreshButtonTapped:
                return fetchArticles(state: &state)

            case let .articleTapped(article):
                state.articleDetail = ArticleDetailFeature.State(article: article)
                return .none

            case let .articlesResponse(.success(articles)):
                state.isLoading = false
                state.articles = articles
                return .none

            case let .articlesResponse(.failure(error)):
                state.isLoading = false
                state.error = error.localizedDescription
                return .none

            case .articleDetail:
                return .none
            }
        }
        .ifLet(\.$articleDetail, action: \.articleDetail) {
            ArticleDetailFeature()
        }
    }

    private func fetchArticles(state: inout State) -> Effect<Action> {
        state.isLoading = true
        state.error = nil

        return .run { send in
            do {
                let articles = try await newsClient.fetchArticles()
                await send(.articlesResponse(.success(articles)))
            } catch {
                await send(.articlesResponse(.failure(error)))
            }
        }
    }
}
