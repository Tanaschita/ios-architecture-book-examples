//
//  Item.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 09.07.26.
//

import Foundation
import SwiftData

struct Item: Identifiable, Equatable, Sendable {
    let id: UUID
    let timestamp: Date
}
