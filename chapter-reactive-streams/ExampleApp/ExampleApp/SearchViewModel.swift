//
//  SearchViewModel.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 16.09.25.
//

import Foundation
import Observation
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var status: String = "Ready to search"

    private var cancellables = Set<AnyCancellable>()

    init() {
        setup()
    }

    private func setup() {
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .filter { !$0.isEmpty }
            .sink { [weak self] query in
                self?.performSearch(for: query)
            }
            .store(in: &cancellables)
    }

    private func performSearch(for query: String) {
        status = "Searching..."

        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            DispatchQueue.main.async {
                self.status = "Results for '\(query)'"
            }
        }
    }
}
