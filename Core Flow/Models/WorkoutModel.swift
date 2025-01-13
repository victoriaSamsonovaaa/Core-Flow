//
//  WorkoutModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 13.01.25.
//

import Foundation

struct WorkoutModel: Codable {
    let back: [ExerciseModel]
    let abs: [ExerciseModel]
    let legs: [ExerciseModel]
    let glutes: [ExerciseModel]
    let arms: [ExerciseModel]
}
