//
//  SignUpEmailViewViewModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 30.12.24.
//

import Foundation

@MainActor
class SignUpEmailViewViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var secondPassword: String = ""
    
    func signUp() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password")
            return
        }
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("success")
                print(returnedUserData)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
