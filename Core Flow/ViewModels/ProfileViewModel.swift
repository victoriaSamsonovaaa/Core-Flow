//
//  ProfileViewModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 26.01.25.
//

import Foundation

@MainActor
class ProfileViewModel: ObservableObject {
    
    @Published var user: DBUser? = nil
    
    func loadCurrentUser() async throws {
        let authDataRes = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataRes.uid)
    }
    
    init() {
        Task {
            do {
                try await loadCurrentUser()
            } catch {
                print("didn't got user: \(error)")
            }
        }
    }
}
