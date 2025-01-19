//
//  SettingsView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 31.12.24.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var items: [String] = .init(
        repeating: "List item",
        count: 100
    )
    
    @State private var isAuth: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List(items, id: \.self) { item in
                    Text(item)
                        .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        .listRowBackground(Color.clear)
                }
                .listStyle(.plain) //Change ListStyle
                .scrollContentBackground(.hidden)
              //  .background(Color.customGreen)
                .navigationTitle("Hello, Victoria!")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            SettingsView(isAuthenticated: $isAuth)
                        } label: {
                            Image(systemName: "gear")
                        }
                    }
                }
            }
        }
        .tint(Color.customBlue)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ProfileView()
}
