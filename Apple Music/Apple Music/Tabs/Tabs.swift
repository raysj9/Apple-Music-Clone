//
//  SwiftUI.swift
//  Apple Music
//
//  Created by Jackson Ray on 8/3/24.
//

/*
 
 switch self {
 case .home:
 case .browse:
 case .radio:
 case .library:
 case .search:
 }
 
 */

import SwiftUI

enum Tabs: Equatable, Hashable, Identifiable {
    case home
    case browse
    case radio
    case library
    case search
    
    var id: Int {
        switch self {
        case .home: 2001
        case .browse: 2002
        case .radio: 2003
        case .library: 2004
        case .search: 2005
        }
    }
    
    var name: String {
        switch self {
        case .home: String(localized: "Home", comment: "Tab title")
        case .browse: String(localized: "Browse", comment: "Tab title")
        case .radio: String(localized: "Radio", comment: "Tab title")
        case .library: String(localized: "Library", comment: "Tab title")
        case .search: String(localized: "Search", comment: "Tab title")
        }
    }
    
    var customizationID: String {
        return "com.samuelray.Apple-Music." + self.name
    }
    
    var symbol: String {
        switch self {
        case .home: "house"
        case .browse: "square.grid.2x2.fill"
        case .radio: "dot.radiowaves.left.and.right"
        case .library: "play.square.stack"
        case .search: "magnifyingglass"
        }
    }
    
    var isSecondary: Bool {
        switch self {
        case .home, .browse, .radio, .library, .search:
            false
        }
    }
}
