//
//  SearchView.swift
//  Apple Music
//
//  Created by Jackson Ray on 8/3/24.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    
                }
                
                PlayBarView()
            }
            .navigationTitle("Search")
        }
    }
}

#Preview {
    MusicTabs(selectedTab: .search)
}

