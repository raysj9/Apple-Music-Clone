//
//  PlayerView.swift
//  Apple Music
//
//  Created by Jackson Ray on 8/6/24.
//

import SwiftUI
import SwiftData

struct PlayerView: View {
    @AppStorage("songIsPlaying") var isPlaying: Bool = false
    @AppStorage("playlistIsShuffled") var isShuffled: Bool = false
    @AppStorage("repeatStatus") var repeatStatus: RepeatStatus = .noRepeat
    @AppStorage("songNumber") var songNumber: Int = 1
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 100)
                .frame(width: 44, height: 4)
                .foregroundStyle(.gray)
            
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.gray)
                .frame(width: 290, height: 290)
                .padding(.top, 50)
            
            Spacer()

            VStack(alignment: .leading, spacing: 50) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Song Name #\(songNumber)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .lineLimit(1)
                        
                        Text("Artist #\(songNumber)")
                            .foregroundStyle(Color(.systemGray5))
                            .lineLimit(1)
                    }
                    
                    Spacer()
                    
                    BackgroundedButton(icon: "star") {
                        print("Favorite button pressed")
                    }
                    .padding(.trailing, 10)
                    
                    Menu {
                        Button { } label: {
                            Label("View Credits", systemImage: "info.circle")
                        }
                        
                        Section {
                            Button(role: .destructive) { } label: {
                                Label("Remove", systemImage: "trash")
                            }
                            Button { } label: {
                                Label("Add to a Playlist", systemImage: "text.badge.plus")
                            }
                        }
                        
                        Section {
                            Button { } label: {
                                Label("Share Song...", systemImage: "square.and.arrow.up")
                            }
                            Button { } label: {
                                Label("Share Lyrics", systemImage: "quote.bubble")
                            }
                            Button { } label: {
                                Label("Go to Album", systemImage: "square.stack")
                            }
                            Button { } label: {
                                Label("Create Station", systemImage: "badge.plus.radiowaves.right")
                            }
                        }
                        
                        Section {
                            Button { } label: {
                                Label("Favorite", systemImage: "star")
                            }
                            Button { } label: {
                                Label("Suggest Less", systemImage: "hand.thumbsdown")
                            }
                        }
                        
                    } label: {
                        BackgroundedButtonLabel(icon: "ellipsis")
                    }
                    .menuOrder(.fixed)
                }
                .padding(.horizontal, 40)
                
                HStack {
                    Button {
                        withAnimation {
                            if songNumber > 1 {
                                songNumber -= 1
                            }
                        }
                    } label: {
                        Image(systemName: "backward.fill")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                    Spacer()
                    Button {
                        isPlaying.toggle()
                    } label: {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                    }
                    Spacer()
                    Button {
                        withAnimation {
                            songNumber += 1
                        }
                    } label: {
                        Image(systemName: "forward.fill")
                            .foregroundStyle(.white)
                            .font(.title)
                    }
                }
                .padding(.horizontal, 70)
            }
            .padding(.bottom, 80)
            
            
            HStack {
                Button {} label: {
                    Image(systemName: "quote.bubble")
                        .foregroundStyle(Color(.systemGray2))
                        .font(.title3)
                }
                Spacer()
                Button {} label: {
                    Image(systemName: "airplay.audio")
                        .foregroundStyle(Color(.systemGray2))
                        .font(.title3)
                }
                Spacer()
                Button {} label: {
                    Image(systemName: "list.bullet")
                        .foregroundStyle(Color(.systemGray2))
                        .font(.title3)
                }
            }
            .padding(.horizontal, 70)
            .padding(.bottom)
        }
        .background(.black.opacity(0.92))
    }
}


#Preview {
    PlayerView()
}

#Preview {
    BackgroundedButton(icon: "star") {
        print("Favorite button pressed")
    }
}
