//
//  MuscleGroupModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 14.01.25.
//

import Foundation

struct MuscleGroupModel: Codable, Identifiable {
    let id = UUID()
    let name: String
    let exercises: [ExerciseModel]
}

