//
//  BackgroundedButton.swift
//  Apple Music
//
//  Created by Jackson Ray on 8/8/24.
//

import SwiftUI

struct BackgroundedButton: View {
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .foregroundStyle(.gray.opacity(0.20))
                    .frame(width: 28, height: 28)
                Image(systemName: icon)
                    .font(.subheadline)
                    .foregroundStyle(.white)
            }
        }
    }
}

struct BackgroundedButtonLabel: View {
    let icon: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.gray.opacity(0.20))
                .frame(width: 28, height: 28)
            Image(systemName: icon)
                .font(.subheadline)
                .foregroundStyle(.white)
        }
    }
}
