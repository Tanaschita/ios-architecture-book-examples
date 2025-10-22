//
//  NewsService.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 13.11.25.
//

import Foundation

protocol NewsServiceProtocol {
    func fetchArticles() async throws -> [Article]
}

class NewsService: NewsServiceProtocol {
    func fetchArticles() async throws -> [Article] {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
        
        // Return mock articles
        return [
            Article(id: UUID(), title: "Article 1", summary: "Summary for article 1"),
            Article(id: UUID(), title: "Article 2", summary: "Summary for article 2"),
            Article(id: UUID(), title: "Article 3", summary: "Summary for article 3")
        ]
    }
}

