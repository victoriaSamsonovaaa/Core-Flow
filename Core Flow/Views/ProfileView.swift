//
//  SettingsView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 31.12.24.
//

import SwiftUI

struct ProfileView: View {

    @State private var isAuth: Bool = false
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        if let user = viewModel.user {
            NavigationStack {
                VStack {
                    List {
                        Text("userID: \(user.userid)")
                    }
                    .navigationTitle("Hello, \(user.fullname)!")
                    .task {
                        try? await viewModel.loadCurrentUser()
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink {
                                SettingsView(isAuthenticated: $isAuth)
                            } label: {
                                Image(systemName: "gear")
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .listStyle(.plain)
                    
                }
                .tint(Color.customBlue)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }

    }
}

#Preview {
    ProfileView()
}
