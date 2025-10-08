//
//  UserViewModel.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 01.09.25.
//

import Foundation
import Observation

@Observable
@MainActor
class UserViewModel {
    @ObservationIgnored @Injected var userService: UserService
    
    var userName: String?
    var isLoading: Bool = false
    
    func loadUser() {
        isLoading = true
        Task {
            let user = await userService.loadUser()
            self.userName = user
            self.isLoading = false
        }
    }
}
