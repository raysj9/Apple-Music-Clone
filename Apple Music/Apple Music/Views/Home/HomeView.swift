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
    @State private var presentingAccountSheet: Bool = false
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                ScrollView {
                    HStack {
                        Text("Home")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button {
                            presentingAccountSheet.toggle()
                        } label: {
                            Circle()
                                .foregroundStyle(.gray)
                                .frame(width: 30, height: 30)
                                .onTapGesture {
                                    presentingAccountSheet.toggle()
                                }
                        }
                        .sheet(isPresented: $presentingAccountSheet) {
                            AccountView()
                        }
                    }
                    .padding(.horizontal)
                    
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
            CardCollectionView(title: "Collection 1", isExpandable: false, path: $path)
            CardCollectionView(title: "Collection 2", isExpandable: false, path: $path)
            CardCollectionView(title: "New Releases for You", isExpandable: true, path: $path)
        }
    }
}


#Preview {
    MusicTabs(selectedTab: .home)
}
