//
//  API.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 02.09.25.
//

import Foundation

protocol UserRepository {
    func fetchUser() async -> String
}

class API: UserRepository {
    func fetchUser() async -> String {
        // Simulate network delay
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return "Example user"
    }
}
