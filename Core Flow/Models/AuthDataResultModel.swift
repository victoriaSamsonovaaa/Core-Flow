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
    let email: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
}
