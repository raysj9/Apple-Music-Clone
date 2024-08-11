import SwiftUI

struct CardCollectionView: View {
    var title: String
    var isExpandable: Bool = false
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                if isExpandable {
                    Image(systemName: "chevron.right")
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                }
            }
            .onTapGesture {
                if isExpandable {
                    path.append("CollectionView")
                }
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(0 ... 2, id: \.self) { item in
                        SquareCardView(title: "Hey!! Ne-yo")
                        SquareCardView(title: "Tchaikovsky: The Nutcracker, Op.71", subtitle: "Bonn Classical Philharmonic & Heirbert Beissel")
                        SquareCardView(title: "Usher", subtitle: "Charity Ray")
                    }
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
        }
        .navigationDestination(for: String.self) { destination in
            if destination == "CollectionView" {
                CollectionView()
            }
        }
    }
}

#Preview {
    MusicTabs(selectedTab: .home)
}
