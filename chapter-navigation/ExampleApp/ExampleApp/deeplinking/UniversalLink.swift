//
//  UniversalLink.swift
//  ExampleApp
//
//  Created by Natascha Fadeeva on 08.10.25.
//

import Foundation

enum UniversalLink {
    // Example URL: https://example.com/search/detail?id=item123
    case searchDetail(id: String)
    // Example URL: https://example.com/settings/profile
    case settingsProfile
    
    init?(from url: URL) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let host = components.host else {
            return nil
        }
        
        switch host {
        case "search":
            if let path = components.path.components(separatedBy: "/").last,
               path == "detail",
               let idString = components.queryItems?.first(where: { $0.name == "id" })?.value {
                self = .searchDetail(id: idString)
            } else {
                return nil
            }
            
        case "settings":
            if let path = components.path.components(separatedBy: "/").last,
               path == "profile" {
                self = .settingsProfile
            } else {
                return nil
            }
            
        default:
            return nil
        }
    }
}
