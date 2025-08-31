//
//  SearchRouter.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 31.08.25.
//

import SwiftUI

@Observable
class SearchRouter {
    var navigationPath = NavigationPath()

    enum Route: Hashable {
        case detail(itemId: String)
    }

    func navigate(to route: Route) {
        navigationPath.append(route)
    }

    func goBack() {
        navigationPath.removeLast()
    }

    func goToRoot() {
        navigationPath = NavigationPath()
    }
}
