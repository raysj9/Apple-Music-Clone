//
//  PlayBarView.swift
//  Apple Music
//
//  Created by Jackson Ray on 8/4/24.
//

import SwiftUI
import SwiftData



struct PlayBarView: View {
    @AppStorage("songIsPlaying") var isPlaying: Bool = false
    @AppStorage("playlistIsShuffled") var isShuffled: Bool = false
    @AppStorage("repeatStatus") var repeatStatus: RepeatStatus = .noRepeat
    @AppStorage("songNumber") var songNumber: Int = 1
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    @Namespace var animation
    
    @State private var playSheetIsPresented: Bool = false
    
    
    var body: some View {
        Button {
            playSheetIsPresented.toggle()
        } label: {
            content
        }
        .buttonStyle(.plain)
        .matchedTransitionSource(id: songNumber, in: animation)
        .fullScreenCover(isPresented: $playSheetIsPresented) {
            PlayerView()
                .navigationTransition(.zoom(sourceID: songNumber, in: animation))
                .presentationDragIndicator(.visible)
        }
    }
    
    var content: some View {
        VStack {
            Spacer()
            
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.gray)
                    .frame(width: 42, height: 42)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Song Name #\(songNumber)")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .lineLimit(1)
                    
                    if horizontalSizeClass != .compact {
                        Text("Artist #\(songNumber)")
                            .font(.subheadline)
                            .lineLimit(1)
                    }
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    if horizontalSizeClass != .compact {
                        Button {
                            withAnimation {
                                isShuffled.toggle()
                            }
                        } label: {
                            Image(systemName: "shuffle")
                                .font(.title3)
                                .tint(isShuffled ? .accentColor : .gray)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 4)
                                .background (
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.pink)
                                        .opacity(isShuffled ? 0.15 : 0)
                                )
                        }
                        
                        Button {
                            withAnimation {
                                if songNumber > 1 {
                                    songNumber -= 1
                                }
                            }
                        } label: {
                            Image(systemName: "backward.fill")
                                .font(.title2)
                        }
                    }
                    
                    Button {
                        isPlaying.toggle()
                    } label: {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(.title)
                    }
                    
                    Button {
                        withAnimation {
                            songNumber += 1
                        }
                    } label: {
                        Image(systemName: "forward.fill")
                            .font(.title2)
                    }
                    
                    if horizontalSizeClass != .compact {
                        Button {
                            withAnimation {
                                repeatStatus = repeatStatus.nextRepeatStatus
                            }
                        } label: {
                            Image(systemName: repeatStatus.icon)
                                .font(.title3)
                                .tint(repeatStatus.iconTintColor)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 4)
                                .background (
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.pink)
                                        .opacity(repeatStatus.iconBackgroundOpacity)
                                )
                        }
                    }
                }
                .tint(.black)
                .padding(.trailing, 6)
                
            }
            .padding(.horizontal, 8)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .foregroundStyle(.white)
                    .frame(height: 60)
                    .shadow(radius: 5)
            )
            .padding(.horizontal, 12)
            .padding(.bottom)
        }
    }
}

enum RepeatStatus: String {
    case noRepeat, repeatAll, repeatSong
    
    var icon: String {
        switch self {
        case .noRepeat, .repeatAll: "repeat"
        case .repeatSong: "repeat.1"
        }
    }
    
    var iconTintColor: Color {
        switch self {
        case .repeatSong, .repeatAll: Color.pink
        case .noRepeat: Color.gray
        }
    }
    
    var iconBackgroundOpacity: CGFloat {
        switch self {
        case .repeatSong, .repeatAll: 0.15
        case .noRepeat: 0
        }
    }
    
    var nextRepeatStatus: RepeatStatus {
        switch self {
        case .noRepeat: .repeatAll
        case .repeatAll: .repeatSong
        case .repeatSong: .noRepeat
        }
    }
}


#Preview {
    MusicTabs()
}
