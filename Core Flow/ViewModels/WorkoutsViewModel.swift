//
//  WorkoutsViewViewModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 16.01.25.
//

import Foundation
import SwiftData

class WorkoutsViewModel: ObservableObject {
    
    @Published var workoutsByPart: WorkoutModel?
    @Published var user: DBUser? = nil
    

    init() {
        loadFromJson()
//        Task {
//            do {
//                try await loadCurrentUser()
//            } catch {
//                print("didn't got user: \(error)")
//            }
//        }
        
    }
    
    func loadCurrentUser() async throws {
        let authDataRes = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataRes.uid)
    }
    
    func loadFromJson() {
        if let decodedWorkouts: WorkoutModel = Bundle.main.decode("workouts.json") {
            workoutsByPart = decodedWorkouts
        } else {
            print("failed to decode workouts.json")
        }
    }
    
    func addToFavourites(exercise: ExerciseModel) async throws {
        try await UserManager.shared.addToFavourite(exercise: exercise, dbUser: &user!)
        print("exercise added to fav")
    }
}

