//
//  UserManager.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 26.01.25.
//

import Foundation
import FirebaseFirestore

struct DBUser: Codable {
    let fullname: String
    let userid: String
    let email: String?
    let dataCreated: Date?
    
    init(auth: AuthDataResultModel, fullName: String) {
        self.fullname = fullName
        self.userid = auth.uid
        self.email = auth.email
        self.dataCreated = Date()
    }
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
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
        try userDocument(userId: user.userid).setData(from: user, merge: false, encoder: encoder)
    }
    
    func getUser(userId: String) async throws -> DBUser {
        try await Firestore.firestore().collection("users").document(userId).getDocument(as: DBUser.self, decoder: decoder)
    }
    
    func updateStatus(user: DBUser) async throws {
        try userDocument(userId: user.userid).setData(from: user, merge: true, encoder: encoder)
    }
}
