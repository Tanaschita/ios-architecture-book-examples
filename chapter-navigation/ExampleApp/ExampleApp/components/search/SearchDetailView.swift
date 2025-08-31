//
//  SearchDetailView.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 31.08.25.
//

import SwiftUI

struct SearchDetailView: View {

    let item: String

    var body: some View {
        VStack {
            Text("Item: \(item)")
                .font(.largeTitle)
        }
        .navigationTitle("Details")
        .navigationBarBackButtonHidden(false)
    }
}
