//
//  ContentViewModel.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 13.11.25.
//

import Foundation

@Observable
class ContentViewModel {
    private let newsService: NewsServiceProtocol
    
    private(set) var articles: [Article] = []
    private(set) var isLoading = false
    private(set) var error: String?
    
    init(newsService: NewsServiceProtocol = NewsService()) {
        self.newsService = newsService
    }
    
    func fetch() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            articles = try await newsService.fetchArticles()
            error = nil
        } catch {
            self.error = error.localizedDescription
        }
    }
}
