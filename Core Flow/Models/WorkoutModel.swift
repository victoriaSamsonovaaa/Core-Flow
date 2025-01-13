//
//  WorkoutModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 13.01.25.
//

import Foundation

struct WorkoutModel: Codable {
    let back: [ExirciseModel]
    let abs: [ExirciseModel]
    let legs: [ExirciseModel]
    let glutes: [ExirciseModel]
    let arms: [ExirciseModel]
}
