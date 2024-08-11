//
//  RadioView.swift
//  Apple Music
//
//  Created by Jackson Ray on 8/3/24.
//

import SwiftUI

struct RadioView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    
                }
                
                PlayBarView()
            }
            .navigationTitle("Radio")
        }
    }
}

#Preview {
    MusicTabs(selectedTab: .radio)
}

