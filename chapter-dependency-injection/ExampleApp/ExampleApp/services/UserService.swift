//
//  UserService.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 01.09.25.
//

import Foundation

class UserService {
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func loadUser() async -> String {
        return await repository.fetchUser()
    }
}
