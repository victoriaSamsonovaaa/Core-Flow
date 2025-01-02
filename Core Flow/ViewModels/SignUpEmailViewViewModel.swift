//
//  SignUpEmailViewViewModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 30.12.24.
//

import Foundation

class SignUpEmailViewViewModel: ObservableObject {

    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var secondPassword: String = ""
    @Published var customMessage: String = ""

    func signUp() {
        let emailOutput = validateEmail(email: email)
        guard !emailOutput.0 else {
            customMessage = emailOutput.1
            return
        }

        let passwordOutput = validatePassword(password: password)
        guard !passwordOutput.0 else {
            customMessage = passwordOutput.1
            return
        }

        let secondPasswordOutput = comparePasswords(password: password, confirmPassword: secondPassword)
        guard !secondPasswordOutput.0 else {
            customMessage = secondPasswordOutput.1
            return
        }

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
            return (false, "You can not leave email field empty. ")
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return (emailPredicate.evaluate(with: email), emailPredicate.evaluate(with: email) ? "" : "Invalid email format")
    }

    func validatePassword(password: String) -> (Bool, String) {
        guard !password.isEmpty else {
            return (false, "You can not leave password field empty. ")
        }

        let passwordRegEx = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?.).{6,15}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return (passwordPredicate.evaluate(with: password), passwordPredicate.evaluate(with: password) ? "" : "Password must contain at least one uppercase letter, one lowercase letter, one number and be between 6 and 15 characters long")
    }

    func comparePasswords(password: String, confirmPassword: String) -> (Bool, String) {
        guard !password.isEmpty else {
            return (false, "You should confirm password. ")
        }

        return (password == confirmPassword, password == confirmPassword ? "" : "Passwords do not match")
    }
}
