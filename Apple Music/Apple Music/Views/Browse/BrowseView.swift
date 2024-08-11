//
//  BrowseView.swift
//  Apple Music
//
//  Created by Jackson Ray on 8/3/24.
//

import SwiftUI

struct BrowseView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    
                }
                
                PlayBarView()
            }
            .navigationTitle("Browse")
        }
    }
}

#Preview {
    MusicTabs(selectedTab: .browse)
}
