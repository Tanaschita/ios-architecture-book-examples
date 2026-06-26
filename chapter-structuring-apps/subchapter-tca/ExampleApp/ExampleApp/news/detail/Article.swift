//
//  Article.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 26.06.26.
//

import Foundation

struct Article: Equatable, Identifiable {
    let id: UUID
    let title: String
    let summary: String
}
