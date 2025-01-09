//
//  HomeView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 9.01.25.
//

import SwiftUI

struct HomeView: View {
    @Binding var isAuthenticated: Bool

    var body: some View {
        NavigationStack {
            SettingsView(isAuthenticated: $isAuthenticated)
        }
    }
}

#Preview {
    HomeView(isAuthenticated: .constant(true))
}
