//
//  AppRouter.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 31.08.25.
//

import Foundation
import Observation

@Observable
class AppRouter {
    var searchRouter = SearchRouter()
    var settingsRouter = SettingsRouter()
    var selectedTab = Tab.search.rawValue
    
    func navigate(to tab: Tab) {
        selectedTab = tab.rawValue
    }
    
    func handle(deeplink url: URL) {
        guard let universalLink = UniversalLink(from: url) else { return }
        
        switch universalLink {
        case .searchDetail(let id):
            navigate(to: .search)
            // Give SwiftUI time to switch tabs before pushing the route
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.searchRouter.navigate(to: .detail(itemId: id))
            }
            
        case .settingsProfile:
            navigate(to: .settings)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.settingsRouter.navigate(to: .profile)
            }
        }
    }
}
