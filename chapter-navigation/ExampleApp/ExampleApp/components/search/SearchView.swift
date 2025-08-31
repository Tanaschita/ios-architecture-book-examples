//
//  SearchView.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 31.08.25.
//

import SwiftUI

struct SearchView: View {
    @Binding var router: SearchRouter

    var body: some View {
        List {
            ForEach(["1", "2", "3", "4", "5"], id: \.self) { item in
                HStack {
                    Text("Item \(item) ")
                    Button("show details") {
                        router.navigate(to: .detail(itemId: item))
                    }
                }
            }
        }
        .navigationTitle("Search")
    }
}
