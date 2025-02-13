//
//  SettingsView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 31.12.24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @State private var isAuth: Bool = false

    var body: some View {
        if let user = viewModel.user {
            NavigationStack {
                List {
                    Section {
                        HStack {
                            Text("\(user.initials)")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.customBlue)
                                .frame(width: 70, height: 70)
                                .background(.gray.opacity(0.5))
                                .clipShape(.circle)
                            
                            VStack(alignment: .leading) {
                                Text("\(user.fullname)")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.customBlue)
                                
                                Text("\(user.email!)")
                                    .font(.footnote)
                                    .accentColor(.customBlue).opacity(0.7)
                            }
                            .accentColor(.customBlue)
                            .padding(.leading, 10)
                        }
                    }
                    
                    Section {
                        NavigationLink {
                            SettingsView(isAuthenticated: $isAuth)
                        } label: {
                            ProfileRowView(imageName: "gear", title: "Settings", tint: .customGreen)
                        }
                        
                        NavigationLink {
                            FavouritesView()
                        } label: {
                            ProfileRowView(imageName: "heart.rectangle.fill", title: "My favourites", tint: .customGreen)
                        }
                        
                        NavigationLink {
                            
                        } label: {
                            ProfileRowView(imageName: "info.circle", title: "Info", tint: .customGreen)
                        }
                    
                    }
                    
                    Section("Other") {
                        NavigationLink {
                            
                        } label: {
                            ProfileRowView(imageName: "rectangle.portrait.and.arrow.right", title: "Log out", tint: .red)
                        }
                        
                    }

                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Personal account")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            SettingsView(isAuthenticated: $isAuth)
                        } label: {
                            Image(systemName: "pencil")
                        }
                    }
                }
            }
            .environmentObject(ExerciseViewModel())
            .tint(.customGreen)
        }
    }
}

#Preview {
    ProfileView()
}
