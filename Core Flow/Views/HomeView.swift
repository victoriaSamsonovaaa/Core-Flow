//
//  HomeView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 31.12.24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showSignUpView: Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                SettingsView(showSignInView: $showSignUpView)
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignUpView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignUpView) {
            NavigationStack {
                SignUpEmailView()
            }
        }
    }
}

#Preview {
    HomeView()
}
