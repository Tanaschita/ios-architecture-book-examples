//
//  NewsClient.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 26.06.26.
//

import ComposableArchitecture
import Foundation

struct NewsClient {
    var fetchArticles: () async throws -> [Article]
}

extension NewsClient: DependencyKey {
    static let liveValue = NewsClient(
        fetchArticles: {
            try await Task.sleep(for: .seconds(1))

            return [
                Article(
                    id: UUID(),
                    title: "Composable Features",
                    summary: "Each TCA feature owns its state, actions, reducer logic, and effects."
                ),
                Article(
                    id: UUID(),
                    title: "Scoped Stores",
                    summary: "Views receive only the state and actions they need for their part of the UI."
                ),
                Article(
                    id: UUID(),
                    title: "Testable Effects",
                    summary: "Dependencies are injected through values, which makes async behavior deterministic in tests."
                )
            ]
        }
    )
}

extension DependencyValues {
    var newsClient: NewsClient {
        get { self[NewsClient.self] }
        set { self[NewsClient.self] = newValue }
    }
}
