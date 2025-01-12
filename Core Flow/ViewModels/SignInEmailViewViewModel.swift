//
//  SignInEmailViewViewModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 30.12.24.
//

import Foundation
import AuthenticationServices
import CryptoKit

@MainActor
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
    
    func signUpWithGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signInGoogle()
        try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
    }
    
    func signUpWithApple() async throws {
        let helper = SignInAppleHelper()
        let tokens = try await helper.startSignInWithAppleFlow()
        try await AuthenticationManager.shared.signInWithApple(tokens: tokens)
    }
    
}
