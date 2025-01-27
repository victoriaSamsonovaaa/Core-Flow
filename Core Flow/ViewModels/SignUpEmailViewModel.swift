//
//  SignUpEmailViewViewModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 30.12.24.
//

import Foundation
import AuthenticationServices
import CryptoKit

@MainActor
class SignUpViewModel: ObservableObject {
    
    let signInAppleHelper = SignInAppleHelper()
    
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var customMessage: String = ""
    @Published var flag: Bool = true
    @Published var isAgree: Bool = false

    func signUp() async throws {
        if isAgree {
            let authDataResult = try await AuthenticationManager.shared.createUser(email: email, password: password)
            print(authDataResult)
            let user = DBUser(auth: authDataResult, fullName: fullName)
            try await UserManager.shared.createNewUser(user: user)
        }
        else {
            customMessage = "You should accept our terms"
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
    
    func signUpWithGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signInGoogle()
        let authDataResult = try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
        let user = DBUser(auth: authDataResult, fullName: fullName)
        try await UserManager.shared.createNewUser(user: user)
    }
    
    func signUpWithApple() async throws {
        let helper = SignInAppleHelper()
        let tokens = try await helper.startSignInWithAppleFlow()
        let authDataResult = try await AuthenticationManager.shared.signInWithApple(tokens: tokens)
        let user = DBUser(auth: authDataResult, fullName: fullName)
        try await UserManager.shared.createNewUser(user: user)
    }
    
}

