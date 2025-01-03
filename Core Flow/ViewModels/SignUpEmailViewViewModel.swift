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
    @Published var customMessage: String = ""
    @Published var flag: Bool = true

    func signUp() {
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                customMessage = "You are signed up successfully"
                print(returnedUserData)
            } catch {
                customMessage = "Something went wrong. Please try again"
                print("Error: \(error)")
            }
        }
    }

    func validateEmail(email: String) -> (Bool, String) {
        guard !email.isEmpty else {
            flag = false
            return (false, "You can not leave email field empty. ")
        }

        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isValid = emailPredicate.evaluate(with: email)

        if !isValid {
            flag = false
        }
        
        return (isValid, isValid ? "" : "Invalid email format")
    }

    func validatePassword(password: String) -> (Bool, String) {
        guard !password.isEmpty else {
            flag = false
            return (false, "You can not leave password field empty.")
        }

        let passwordRegEx = "(?=.*[0-9])(?=.*[A-Z])[0-9a-zA-Z]{6,15}"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        let isValid = passwordPredicate.evaluate(with: password)

        if !isValid {
            flag = false
        }
        
        return (isValid, isValid ? "" : "Password must contain at least one uppercase letter, one number and be between 6 and 15 characters long")
    }

    func comparePasswords(password: String, confirmPassword: String) -> (Bool, String) {
        guard !password.isEmpty else {
            flag = false
            return (false, "You should confirm password.")
        }

        let passwordsMatch = (password == confirmPassword)

        if !passwordsMatch {
            flag = false
        }

        return (passwordsMatch, passwordsMatch ? "" : "Passwords do not match")
    }
}
