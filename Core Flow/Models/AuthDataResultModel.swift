//
//  AuthDataResultModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 31.12.24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let name: String?
    let email: String?
    let photoURL: String?
    
    init(user: User) {
        self.uid = user.uid
        self.name = user.displayName
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
}
