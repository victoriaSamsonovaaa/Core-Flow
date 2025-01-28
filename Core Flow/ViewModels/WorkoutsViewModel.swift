//
//  WorkoutsViewViewModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 16.01.25.
//

import Foundation
import SwiftData

class WorkoutsViewModel: ObservableObject {
    @Published var favoriteIds: Set<Int> = []
    
//    func loadFavorites() async {
//        do {
//            let currentUser = try AuthenticationManager.shared.getAuthenticatedUser()
//            let dbUser = try await UserManager.shared.getUser(userId: currentUser.uid)
//            let favIds = dbUser.favWorkouts.map { $0.id }
//            favoriteIds = Set(f)
//            markFavorites()
//        } catch {
//            print("Не удалось загрузить избранные упражнения: \(error.localizedDescription)")
//        }
//    }
    
    func addToFavourites(exercise: ExerciseModel) async throws {
        try await UserManager.shared.addToFavourite(exercise: exercise)
        print("exercise added")
    }

}
