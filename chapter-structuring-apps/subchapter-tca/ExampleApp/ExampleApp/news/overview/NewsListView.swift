//
//  NewsListView.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 26.06.26.
//

import SwiftUI
import ComposableArchitecture

struct NewsListView: View {
    @Bindable var store: StoreOf<NewsFeature>

    var body: some View {
        NavigationStack {
            Group {
                if store.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let error = store.error {
                    ContentUnavailableView(
                        "Could not load articles",
                        systemImage: "exclamationmark.triangle",
                        description: Text(error)
                    )
                } else {
                    List(store.articles) { article in
                        Button {
                            store.send(.articleTapped(article))
                        } label: {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(article.title)
                                    .font(.headline)
                                    .foregroundStyle(.primary)
                                Text(article.summary)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("News Articles")
            .toolbar {
                Button {
                    store.send(.refreshButtonTapped)
                } label: {
                    Label("Refresh", systemImage: "arrow.clockwise")
                }
            }
            .navigationDestination(
                item: $store.scope(state: \.articleDetail, action: \.articleDetail)
            ) { detailStore in
                ArticleDetailView(store: detailStore)
            }
            .task {
                store.send(.onAppear)
            }
        }
    }
}
