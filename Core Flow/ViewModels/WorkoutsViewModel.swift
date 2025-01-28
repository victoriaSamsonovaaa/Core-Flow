//
//  WorkoutsViewViewModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 16.01.25.
//

import Foundation
import SwiftData

class WorkoutsViewModel: ObservableObject {
    
    func addToFavourites(exercise: ExerciseModel) async throws {
        let currAuthUser = try AuthenticationManager.shared.getAuthenticatedUser()
        print("got user")
        let dbUser = try await UserManager.shared.getUser(userId: currAuthUser.uid)
        print("got dbUser")
        try await UserManager.shared.addToFavourite(exercise: exercise, user: dbUser)
        print("added")
    }
}
