//
//  HomeView.swift
//  Apple Music
//
//  Created by Jackson Ray on 8/3/24.
//

import SwiftUI

struct HomeView: View {
    @Binding var selectedTab: Tabs
    @State private var path = NavigationPath()
        
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                ScrollView {
                    content
                        .padding(.bottom, 100)
                }
                
                PlayBarView()
            }
            .navigationTitle("Home")
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 12) {
            CardCollectionView(title: "Recently Played", isExpandable: true, path: $path)
            CardCollectionView(title: "World of Bob Marley", isExpandable: false, path: $path)
            CardCollectionView(title: "USHER Fans Like", isExpandable: false, path: $path)
            CardCollectionView(title: "New Releases for You", isExpandable: true, path: $path)
        }
    }
}


#Preview {
    MusicTabs(selectedTab: .home)
}
