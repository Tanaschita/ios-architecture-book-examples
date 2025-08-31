//
//  AppRouter.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 31.08.25.
//

import Observation

@Observable
class AppRouter {
    var searchRouter = SearchRouter()
    var settingsRouter = SettingsRouter()
    var selectedTab = Tab.search.rawValue
    
    func navigate(to tab: Tab) {
        selectedTab = tab.rawValue
    }
}
