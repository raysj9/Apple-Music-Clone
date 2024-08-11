//
//  LibraryView.swift
//  Apple Music
//
//  Created by Jackson Ray on 8/3/24.
//

import SwiftUI

enum LibraryTab: String, CaseIterable, Identifiable {
    case playlists, artists, albums, songs, madeForYou, musicVidios, genres, compilations, composers, downloaded
    
    var id: String { self.rawValue }
    
    var title: String {
        switch self {
        case .playlists: return "Playlists"
        case .artists: return "Artists"
        case .albums: return "Albums"
        case .songs: return "Songs"
        case .madeForYou: return "Made for You"
        case .musicVidios: return "Music Videos"
        case .genres: return "Genres"
        case .compilations: return "Compilations"
        case .composers: return "Composers"
        case .downloaded: return "Downloaded"
        }
    }
    
    var icon: String {
        switch self {
        case .playlists: return "music.note.list"
        case .artists: return "music.microphone"
        case .albums: return "square.stack"
        case .songs: return "music.note"
        case .madeForYou: return "person.crop.square"
        case .musicVidios: return "music.note.tv"
        case .genres: return "guitars"
        case .compilations: return "person.2.crop.square.stack"
        case .composers: return "music.quarternote.3"
        case .downloaded: return "arrow.down.circle"
        }
    }
}

struct LibraryView: View {
    @State private var libraryTabs: [LibraryTab] = LibraryTab.allCases
    @State private var isEditing = false
    @State private var selectedTabs: Set<LibraryTab> = Set(LibraryTab.allCases)
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(filteredTabs, id: \.self) { tab in
                        HStack {
                            if isEditing {
                                Image(systemName: selectedTabs.contains(tab) ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(selectedTabs.contains(tab) ? .accentColor : .gray)
                                    .imageScale(.large)
                                    .padding(.trailing, 6)
                                    .onTapGesture {
                                        toggleSelection(of: tab)
                                    }
                            }
                            NavigationLink {
                                ScrollView {
                                    Text(tab.title)
                                }
                                .navigationTitle(tab.title)
                            } label: {
                                Label(tab.title, systemImage: tab.icon)
                            }
                        }
                    }
                    .onMove { indexSet, offset in
                        libraryTabs.move(fromOffsets: indexSet, toOffset: offset)
                    }
                }
                .listStyle(.plain)
                .toolbar {
                    EditButton()
//                        .onChange(of: isEditing) { _ in
//                            // Optionally reset selection state here if needed
//                        }
                }
                
                PlayBarView()
            }
            .navigationTitle("Library")
            .environment(\.editMode, Binding(get: { isEditing ? .active : .inactive }, set: { isEditing = $0 == .active }))
        }
    }
    
    private var filteredTabs: [LibraryTab] {
        isEditing ? libraryTabs : libraryTabs.filter { selectedTabs.contains($0) }
    }
    
    private func toggleSelection(of tab: LibraryTab) {
        if selectedTabs.contains(tab) {
            selectedTabs.remove(tab)
        } else {
            selectedTabs.insert(tab)
        }
    }
    
    private func move(from source: IndexSet, to destination: Int) {
        libraryTabs.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    MusicTabs(selectedTab: .library)
}
