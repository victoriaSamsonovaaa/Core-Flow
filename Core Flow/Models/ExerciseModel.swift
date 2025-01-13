//
//  ExirciseModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 13.01.25.
//

import Foundation

struct ExerciseModel: Codable, Identifiable {
    let id: Int
    let workoutName: String
    let workoutDescription: String
    let workoutExplanation: String
    let workoutImage: String
    let workoutDifficulty: Int
}
