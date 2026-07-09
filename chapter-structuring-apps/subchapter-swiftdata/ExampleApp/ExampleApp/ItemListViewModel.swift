//
//  ItemListViewModel.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 09.07.26.
//

import Foundation
import Observation

@MainActor
@Observable
final class ItemListViewModel {
    private let repository: any ItemRepository

    private(set) var items: [Item] = []
    private(set) var errorMessage: String?

    init(repository: any ItemRepository) {
        self.repository = repository
    }

    func loadItems() {
        do {
            items = try repository.fetchItems()
            errorMessage = nil
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func addItem() {
        do {
            try repository.addItem(timestamp: Date())
            loadItems()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func deleteItems(at offsets: IndexSet) {
        do {
            let itemsToDelete = offsets.map { items[$0] }
            try repository.deleteItems(itemsToDelete)
            loadItems()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
