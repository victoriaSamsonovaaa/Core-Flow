//
//  BaseView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 9.01.25.
//

import SwiftUI

struct FirstBaseView: View {
    
    @State private var isAuthenticated: Bool = false
    
    var body: some View {
        ZStack {
            if isAuthenticated {
                MainTabScreenView()
            } else {
                StartView(isAuthenticated: $isAuthenticated)
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            isAuthenticated = authUser != nil
        }
    }
}

#Preview {
    FirstBaseView()
}
