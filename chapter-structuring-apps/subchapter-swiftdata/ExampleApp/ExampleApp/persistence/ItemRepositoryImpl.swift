//
//  SwiftDataItemRepository.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 09.07.26.
//

import Foundation
import SwiftData

@Model
final class PersistedItem {
    var id: UUID
    var timestamp: Date

    init(id: UUID = UUID(), timestamp: Date) {
        self.id = id
        self.timestamp = timestamp
    }
}

@MainActor
final class ItemRepositoryImpl: ItemRepository {
    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func fetchItems() throws -> [Item] {
        let descriptor = FetchDescriptor<PersistedItem>(
            sortBy: [SortDescriptor(\.timestamp, order: .forward)]
        )
        return try modelContext.fetch(descriptor).map { persistedItem in
            Item(
                id: persistedItem.id,
                timestamp: persistedItem.timestamp
            )
        }
    }

    func addItem(timestamp: Date = Date()) throws {
        modelContext.insert(PersistedItem(timestamp: timestamp))
        try modelContext.save()
    }

    func deleteItems(_ items: [Item]) throws {
        for item in items {
            try deleteItem(withID: item.id)
        }
        try modelContext.save()
    }

    private func deleteItem(withID id: UUID) throws {
        let descriptor = FetchDescriptor<PersistedItem>(
            predicate: #Predicate { item in
                item.id == id
            }
        )

        if let persistedItem = try modelContext.fetch(descriptor).first {
            modelContext.delete(persistedItem)
        }
    }
}
