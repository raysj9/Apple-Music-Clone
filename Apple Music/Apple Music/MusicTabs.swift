//
//  MusicTabs.swift
//  Apple Music
//
//  Created by Jackson Ray on 8/3/24.
//

import SwiftUI
import SwiftData

struct MusicTabs: View {
    @AppStorage("sidebarCustomizations") var tabViewCustomization: TabViewCustomization
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    @Namespace private var namespace
    @State var selectedTab: Tabs = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(Tabs.home.name, systemImage: Tabs.home.symbol, value: .home) {
                HomeView(selectedTab: $selectedTab)
            }
            .customizationID(Tabs.home.customizationID)
            
            Tab(Tabs.browse.name, systemImage: Tabs.browse.symbol, value: .browse) {
                BrowseView()
            }
            .customizationID(Tabs.browse.customizationID)
            
            Tab(Tabs.radio.name, systemImage: Tabs.radio.symbol, value: .radio) {
                RadioView()
            }
            .customizationID(Tabs.radio.customizationID)
            
            Tab(Tabs.library.name, systemImage: Tabs.library.symbol, value: .library) {
                LibraryView()
            }
            .customizationID(Tabs.library.customizationID)
            
            Tab(Tabs.search.name, systemImage: Tabs.search.symbol, value: .search, role: .search) {
                SearchView()
            }
            .customizationID(Tabs.search.customizationID)
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabViewCustomization($tabViewCustomization)
    }
}

#Preview {
    MusicTabs()
}
