//
//  ExampleAppApp.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 01.09.25.
//

import SwiftUI

@main
struct ExampleApp: App {
    init() {
        setupDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            UserView()
        }
    }
    
    private func setupDependencies() {
        let container = DIContainer.shared
        container.register(UserRepository.self, factory: { API() })
        container.register(UserService.self, factory: { 
            UserService(repository: container.resolve(UserRepository.self)!)
        }, lifetime: .singleton)
    }
}
