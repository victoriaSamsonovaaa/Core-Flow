//
//  SignInEmailViewViewModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 30.12.24.
//

import Foundation

class SignInViewViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var customMessage: String = ""
    
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            customMessage = "You couldn't leave fields empty"
            return
        }
        
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
    
}
