//
//  ContentView.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 05.11.25.
//

import SwiftUI

struct SearchView: View {
    @State private var viewModel = SearchViewModel()
    @State var query = ""

    var body: some View {
        VStack(spacing: 24) {
            TextField("Type to search…", text: $query)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onChange(of: query) { _, newValue in
                    viewModel.updateQuery(newValue)
                }

            Text(viewModel.result)
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}
