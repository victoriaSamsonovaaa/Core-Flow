//
//  AuthenticationManager.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 31.12.24.
//

import Foundation
import FirebaseAuth

enum AuthProviderOption: String {
    case email = "password"
    case google = "google.com"
}

class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    private init() { }
    
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        return AuthDataResultModel(user: user)
    }
    
//    func getProvider() throws -> [AuthProviderOption] {
//        guard let providerData = Auth.auth().currentUser?.providerData else {
//            throw URLError(.badServerResponse)
//        }
//        var providers: [AuthProviderOption] = []
//        for provider in providerData {
//            if let option = AuthProviderOption(rawValue: provider.providerID) {
//                providers.append(option)
//            } else {
//                assertionFailure("Provider option not found: \(provider.providerID)")
//            }
//        }
//        return providers
//    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}

// MARK: SIGN IN EMAIL
extension AuthenticationManager {
    
    //@discardableResult
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResults = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResults.user)
    }
    
    @discardableResult
    func signInUser(email: String, password: String) async throws -> AuthDataResultModel  {
        let authDataResults = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResults.user)
    }
    
    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func updatePassword(password: String) async throws {
        guard let authUser = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        try await authUser.updatePassword(to: password)
    }
}

// MARK: SIGN IN SSO
extension AuthenticationManager {
    
    @discardableResult
    func signInWithGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await signIn(credential: credential)
    }
    
    func signIn(credential: AuthCredential) async throws -> AuthDataResultModel {
        let authDataResults = try await Auth.auth().signIn(with: credential)
        return AuthDataResultModel(user: authDataResults.user)
    }
}
