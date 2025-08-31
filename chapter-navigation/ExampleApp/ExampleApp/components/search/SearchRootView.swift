//
//  SearchRootView.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 31.08.25.
//

import SwiftUI

struct SearchRootView: View {
    @Binding var router: SearchRouter

    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            SearchView(router: $router)
                .navigationDestination(for: SearchRouter.Route.self) { route in
                    switch route {
                    case .detail(let item):
                        SearchDetailView(item: item)
                    }
                }
        }
    }
}
