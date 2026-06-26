//
//  ArticleDetailView.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 26.06.26.
//

import SwiftUI
import ComposableArchitecture

struct ArticleDetailView: View {
    let store: StoreOf<ArticleDetailFeature>

    var body: some View {
        Form {
            Section {
                Text(store.article.summary)
            }
        }
        .navigationTitle(store.article.title)
    }
}
