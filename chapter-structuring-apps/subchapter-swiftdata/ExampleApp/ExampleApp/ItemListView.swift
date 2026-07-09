//
//  ContentView.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 09.07.26.
//

import SwiftUI

struct ItemListView: View {
    @State private var viewModel: ItemListViewModel

    init(repository: any ItemRepository) {
        _viewModel = State(initialValue: ItemListViewModel(repository: repository))
    }

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(viewModel.items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: viewModel.addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .task {
                viewModel.loadItems()
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            viewModel.deleteItems(at: offsets)
        }
    }
}
