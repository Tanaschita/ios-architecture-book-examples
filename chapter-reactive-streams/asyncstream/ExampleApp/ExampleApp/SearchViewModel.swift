//
//  SearchViewModel.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 05.11.25.
//

import Foundation
import Observation
import AsyncAlgorithms

@MainActor
@Observable
class SearchViewModel {
    var result = ""

    private let searchInput = AsyncPassthrough<String>()
    private var searchTask: Task<Void, Never>?

    init() {
        searchTask = Task {
            for await query in await searchInput.stream()
                .debounce(for: .seconds(0.5), clock: .continuous)
                .removeDuplicates()
            {
                await performSearch(for: query)
            }
        }
    }

    func updateQuery(_ text: String) {
        Task { await searchInput.send(text) }
    }

    private func performSearch(for query: String) async {
        try? await Task.sleep(for: .seconds(0.3))
        await MainActor.run {
            result = "Results for '\(query)'"
        }
    }
}
