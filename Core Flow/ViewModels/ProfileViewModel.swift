//
//  ProfileViewModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 26.01.25.
//

import Foundation

@MainActor
class ProfileViewModel: ObservableObject {
    
    @Published private(set) var user: AuthDataResultModel? = nil
    
    func loadCurrentUser() throws {
        self.user = try AuthenticationManager.shared.getAuthenticatedUser()
    }
}
