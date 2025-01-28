//
//  UserManager.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 26.01.25.
//

import Foundation
import FirebaseFirestore


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
        do {
            return try await Firestore.firestore().collection("users").document(userId).getDocument(as: DBUser.self, decoder: decoder)
        } catch {
            print("Ошибка при получении пользователя из Firestore: \(error.localizedDescription)")
            throw error
        }
    }
    
    func addToFavourite(exercise: ExerciseModel) async throws {
        do {
            let currAuthUser = try AuthenticationManager.shared.getAuthenticatedUser()
            var dbUser = try await getUser(userId: currAuthUser.uid)
            if !dbUser.favWorkouts.contains(where: { $0.id == exercise.id }) {
                dbUser.favWorkouts.append(exercise)
                try userDocument(userId: dbUser.userid).setData(from: dbUser, merge: true, encoder: encoder)
              } else {
                  print("already there")
              }
        } catch {
            print("error: \(error.localizedDescription)")
            throw error
        }
    }
}
