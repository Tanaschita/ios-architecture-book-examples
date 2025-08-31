//
//  Tab.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 31.08.25.
//

import Foundation

enum Tab: Int, CaseIterable {
    case search = 0
    case settings = 1

    var title: String {
        switch self {
        case .search: return "Search"
        case .settings: return "Settings"
        }
    }

    var icon: String {
        switch self {
        case .search: return "magnifyingglass"
        case .settings: return "gearshape"
        }
    }
}
