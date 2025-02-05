//
//  ExerciseViewViewModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 16.01.25.
//

import Foundation

class ExerciseViewModel: ObservableObject {
    
    @Published var workoutsByPart: WorkoutModel?
    @Published var user: DBUser? = nil

    init() {
        loadFromJson()
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
    
    func pressHeart(exercise: ExerciseModel) async throws {
        do {
            try await UserManager.shared.pressHeart(exercise: exercise)
        } catch {
            print("smth happened during tapping")
        }
    }
    
    func isFav(exercise: ExerciseModel) async throws -> Bool {
        if user != nil {
            let ans = try await UserManager.shared.isInDB(exercise: exercise).0
            print(ans)
            return ans
        } else {
            return false
        }
    }
}
