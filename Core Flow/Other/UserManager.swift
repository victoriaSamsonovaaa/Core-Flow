//
//  UserManager.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 26.01.25.
//

import Foundation
import FirebaseFirestore

struct DBUser: Codable {
 //   let name: String
    let userId: String
    let email: String?
    let photourl: String?
    let dataCreated: Date?
    
    init(auth: AuthDataResultModel) {
        self.userId = auth.uid
        self.email = auth.email
        self.photourl = auth.photoURL
        self.dataCreated = Date()
    }
}

final class UserManager {
    
    static let shared = UserManager()
    private init() {}
    
    private let userCollection = Firestore.firestore().collection("users")
    
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func createNewUser(user: DBUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false, encoder: encoder)
    }
    
    func getUser(userId: String) async throws -> DBUser {
        try await Firestore.firestore().collection("user").document(userId).getDocument(as: DBUser.self, decoder: decoder)
    }
    
    func updateStatus(user: DBUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: true, encoder: encoder)
    }
    
//    func createNewUser(auth: AuthDataResultModel) async throws {
//        var userData: [String: Any] = [
//            "user_id" : auth.uid,
//            "date_created" : Timestamp(),
//        ]
//        if let email = auth.email {
//            userData["email"] = email
//        }
//        if let photourl = auth.photoURL {
//            userData["photo_url"] = photourl
//        }
//        
//        try await userDocument(userId: auth.uid).setData(userData, merge: false)
//    }
    
    
//    func getUser(userId: String) async throws -> DBUser {
//        let snapsh = try await Firestore.firestore().collection("user").document(userId).getDocument()
//        
//        guard let data = snapsh.data(), let userId = data["user_id"] as? String else {
//            throw URLError(.badServerResponse)
//        }
//        
//        let email = data["email"] as? String
//        let photourl = data["photo_url"] as? String
//        let dataCreated = data["date_created"] as? Date
//        
//        return DBUser(userId: userId, email: email, photourl: photourl, dataCreated: dataCreated)
//    }
}
