//
//  ItemRepository.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 09.07.26.
//

import Foundation

@MainActor
protocol ItemRepository {
    func fetchItems() throws -> [Item]
    func addItem(timestamp: Date) throws
    func deleteItems(_ items: [Item]) throws
}
