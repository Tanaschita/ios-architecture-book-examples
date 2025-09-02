//
//  ContentView.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 01.09.25.
//

import SwiftUI

struct UserView: View {
    @State private var viewModel = UserViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("This demonstrates the DI container in action.")
                .fontWeight(.bold)
            
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let name = viewModel.userName {
                Text("\(name)")
                    .font(.headline)
            }
            
            Button("Load") {
                viewModel.loadUser()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
