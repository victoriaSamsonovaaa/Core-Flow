//
//  SettingsViewViewModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 31.12.24.
//

import Foundation

class SettingsViewViewModel: ObservableObject {
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            print("smth went wrong with getting email")
            return
        }
        
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
}
