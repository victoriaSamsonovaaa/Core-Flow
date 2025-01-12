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
    
    var body: some View {
        NavigationStack {
            VStack {
                List(items, id: \.self) { item in
                    Text(item)
                        .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        .listRowBackground(Color.clear)
                       // .toolbarBackground(Color(#colorLiteral(red: 0.3328896165, green: 0.4141520262, blue: 0.3390924037, alpha: 1)))
                }
                .listStyle(.plain) //Change ListStyle
                .scrollContentBackground(.hidden)
              //  .background(Color.customGreen)
                .navigationTitle("Hello, Victoria!")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Settings", systemImage: "gear") {
                            
                        }
                    }
                }
                .tint(Color.customBlue)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ProfileView()
}
