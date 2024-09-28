//
//  AccountView.swift
//  Apple Music
//
//  Created by Samuel Ray on 8/13/24.
//

import SwiftUI

struct AccountView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Account")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button { dismiss() } label: {
                            Text("Done")
                            //                            .fontWeight(.semibold)
                        }
                    }
                }
        }
        
    }
    
    var content: some View {
        List {
            Section(footer: Text("Your name and photo will be shown to others in playlists or while listening together.")) {
                NavigationLink {
                    
                } label: {
                    HStack {
                        Circle()
                            .foregroundStyle(.gray)
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text("Samuel Ray")
                                .font(.subheadline)
                            Text("View Profile")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            
            Section {
                Button { } label: {
                    AccountListItem(title: "Redeem Gift Card or Code")
                }
                Button { } label: {
                    AccountListItem(title: "Add Funds to Apple Account")
                }
                Button { } label: {
                    AccountListItem(title: "Manage Subscription")
                }
                Button { } label: {
                    AccountListItem(title: "Manage Family")
                }
            }
            
            Section {
                NavigationLink { } label: {
                    AccountListItem(title: "Notifications")
                }
            }
            
            Section(header: Text("Find Friends"), footer: Text("Apple Music will periodically check the contacts on your devices to recommend new friends.")) {
                AccountListToggleItem(title: "Contacts on Apple Music")
            }
            
            Section(footer: Text("People who have your Apple Account contact information may see you as a recommended friend.")) {
                AccountListToggleItem(title: "Allow Finding by Apple Account")
            }
            
            Section(header: Text("Apps with Access")) {
                AccountListToggleItem(title: "Apple TV+ Cox TV Web Views")
                AccountListToggleItem(title: "Apple Media Web Player")
                AccountListToggleItem(title: "Apple Music on Apple TV")
                AccountListToggleItem(title: "Apple Music on Alexa")
                AccountListToggleItem(title: "Waze")
                AccountListToggleItem(title: "SongShift")
            }
            
            Section {
                Button { } label: {
                    AccountListItem(title: "Account Settings")
                }
                
            }
        }
    }
}

struct AccountListItem: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.vertical, 8)
        }
    }
}

struct AccountListToggleItem: View {
    let title: String
    @State private var toggleIsOn: Bool = true
    @State private var showAlert = false
    
    var body: some View {
        Toggle(title, isOn: $toggleIsOn)
            .padding(.vertical, 4)
            .onChange(of: toggleIsOn) { newValue in
                if !newValue {
                    showAlert = true
                }
            }
            .alert("Remove \"\(title)\"?", isPresented: $showAlert) {
                Button("Cancel", role: .cancel) {
                    toggleIsOn = true
                }
                Button("Remove", role: .destructive) {
                    // TODO: Handle Action
                }
            } message: {
                Text("To re-connect, you'll need to sign in to Apple Music through this app.")
            }
    }
}


#Preview {
    AccountView()
}
