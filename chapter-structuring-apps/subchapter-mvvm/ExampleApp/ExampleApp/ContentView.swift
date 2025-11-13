//
//  ContentView.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 08.10.25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let error = viewModel.error {
                    VStack(spacing: 16) {
                        Image(systemName: "exclamationmark.triangle")
                            .imageScale(.large)
                            .foregroundStyle(.red)
                        Text(error)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List(viewModel.articles) { article in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(article.title)
                                .font(.headline)
                            Text(article.summary)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("News Articles")
            .task {
                await viewModel.fetch()
            }
        }
    }
}
