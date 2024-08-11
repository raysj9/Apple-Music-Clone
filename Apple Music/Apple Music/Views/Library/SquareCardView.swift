//
//  SquareCardView.swift
//  Apple Music
//
//  Created by Jackson Ray on 8/5/24.
//

import SwiftUI

struct SquareCardView: View {
    var title: String
    var subtitle: String = " "
    
    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.gray)
                .frame(width: 175, height: 175)
            Text(title)
                .font(.subheadline)
                .lineLimit(1)
                .padding(.horizontal, 2)
            Text(subtitle)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(1)
                .padding(.horizontal, 2)

        }
        .frame(width: 175)
    }
}

struct CollectionView: View, Hashable {
    var body: some View {
        Text("Collection View")
    }
}



#Preview {
    HStack {
        SquareCardView(title: "Gospel")
        SquareCardView(title: "Tchaicovsky: The Nutcracker, Op.71", subtitle: "Bonn Classical Philharmonic & Heirbert Beissel")
    }
}
