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
            print("didn't get user from firestore: \(error.localizedDescription)")
            throw error
        }
    }
    
    func isInDB(exercise: ExerciseModel) async throws -> (Bool, Int?, DBUser) {
        let currAuthUser = try AuthenticationManager.shared.getAuthenticatedUser()
        let dbUser = try await getUser(userId: currAuthUser.uid)
        
        let index = dbUser.favWorkouts.firstIndex {
            $0.workoutName == exercise.workoutName
        }
        if index != nil {
            print("exercise was found in db")
        } else {
            print("exercise wasn't found in db")
        }
        return (index != nil, index, dbUser)
    }
    
    func pressHeart(exercise: ExerciseModel) async throws {
        var (isInFavourite, index, user) = try await isInDB(exercise: exercise)

        if isInFavourite {
            if let index = index {
                user.favWorkouts[index].isFavourite = false
                user.favWorkouts.remove(at: index)
                print("exercise removed from fav")
            }
        } else {
            user.favWorkouts.append(exercise)
            var lastEx = user.favWorkouts.last
            lastEx?.isFavourite = true
            print("exercise added to fav")
        }
        try userDocument(userId: user.userid).setData(from: user, merge: true, encoder: encoder)
    }
    
    func getFavouritesExercises() async throws -> [ExerciseModel] {
        let currAuthUser = try AuthenticationManager.shared.getAuthenticatedUser()
        let dbUser = try await getUser(userId: currAuthUser.uid)
        return dbUser.favWorkouts
    }
}


//    func addToFavourite(exercise: ExerciseModel, dbUser: inout DBUser) async throws {
//        do {
//            let currAuthUser = try AuthenticationManager.shared.getAuthenticatedUser()
//            var dbUser = try await getUser(userId: currAuthUser.uid)
//            if !dbUser.favWorkouts.contains(where: { $0.id == exercise.id }) {
//                dbUser.favWorkouts.append(exercise)
//                try userDocument(userId: dbUser.userid).setData(from: dbUser, merge: true, encoder: encoder)
//              } else {
//                  print("already there")
//              }
//        } catch {
//            print("didn't add to fav: \(error.localizedDescription)")
//            throw error
//        }
//    }
//
//    func removeFromFavourite(exercise: ExerciseModel, dbUser: inout DBUser) async throws {
//        do {
//            if let index = dbUser.favWorkouts.firstIndex(where: { $0.id == exercise.id }) {
//                dbUser.favWorkouts.remove(at: index)
//                try userDocument(userId: dbUser.userid).setData(from: dbUser, merge: true, encoder: encoder)
//            } else {
//                print("did't found in fav")
//            }
//        } catch {
//            print("didn't remove from fav: \(error.localizedDescription)")
//            throw error
//        }
//    }
