//
//  BaseView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 9.01.25.
//

import SwiftUI

struct BaseView: View {
    
    @State private var isAuthenticated: Bool = false
    
    var body: some View {
        ZStack {
            if isAuthenticated {
                HomeView(isAuthenticated: $isAuthenticated)
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
    BaseView()
}
