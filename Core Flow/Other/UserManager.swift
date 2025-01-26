//
//  UserManager.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 26.01.25.
//

import Foundation
import FirebaseFirestore

struct DBUser {
    let userId: String
    let email: String?
    let photourl: String?
    let dataCreated: Date?
}

final class UserManager {
    
    static let shared = UserManager()
    private init() {}
    
    func createNewUser(auth: AuthDataResultModel) async throws {
        var userData: [String: Any] = [
            "user_id" : auth.uid,
            "date_created" : Timestamp(),
        ]
        if let email = auth.email {
            userData["email"] = email
        }
        if let photourl = auth.photoURL {
            userData["photo_url"] = photourl
        }
        
        try await Firestore.firestore().collection("users").document(auth.uid).setData(userData, merge: false )
    }
    
    func getUser(userId: String) async throws -> DBUser {
        let snapsh = try await Firestore.firestore().collection("user").document(userId).getDocument()
        
        guard let data = snapsh.data(), let userId = data["user_id"] as? String else {
            throw URLError(.badServerResponse)
        }
        
        let email = data["email"] as? String
        let photourl = data["photo_url"] as? String
        let dataCreated = data["date_created"] as? Date
        
        return DBUser(userId: userId, email: email, photourl: photourl, dataCreated: dataCreated)
        
    }
}
