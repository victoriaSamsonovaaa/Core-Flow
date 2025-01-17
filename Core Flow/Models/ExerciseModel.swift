//
//  ExirciseModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 13.01.25.
//

//import Foundation
//import SwiftData
//
//
//struct ExerciseModel: Codable, Identifiable {
//    let id = UUID()
//    let workoutName: String
//    let workoutDescription: String
//    let workoutExplanation: String
//    let workoutImage: String
//    let workoutDifficulty: Int
//    let isFavourite: Bool
//}

import SwiftUI
import SwiftData

@Model
class ExerciseModel: Codable, Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    var workoutName: String
    var workoutDescription: String
    var workoutExplanation: String
    var workoutImage: String
    var workoutDifficulty: Int
    var isFavourite: Bool = false 

    init(id: UUID = UUID(), workoutName: String, workoutDescription: String, workoutExplanation: String, workoutImage: String, workoutDifficulty: Int, isFavourite: Bool = false) {
        self.id = id
        self.workoutName = workoutName
        self.workoutDescription = workoutDescription
        self.workoutExplanation = workoutExplanation
        self.workoutImage = workoutImage
        self.workoutDifficulty = workoutDifficulty
        self.isFavourite = isFavourite
    }

    // Декодирование из JSON
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.workoutName = try container.decode(String.self, forKey: .workoutName)
        self.workoutDescription = try container.decode(String.self, forKey: .workoutDescription)
        self.workoutExplanation = try container.decode(String.self, forKey: .workoutExplanation)
        self.workoutImage = try container.decode(String.self, forKey: .workoutImage)
        self.workoutDifficulty = try container.decode(Int.self, forKey: .workoutDifficulty)
    }

    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(workoutName, forKey: .workoutName)
        try container.encode(workoutDescription, forKey: .workoutDescription)
        try container.encode(workoutExplanation, forKey: .workoutExplanation)
        try container.encode(workoutImage, forKey: .workoutImage)
        try container.encode(workoutDifficulty, forKey: .workoutDifficulty)
        try container.encode(isFavourite, forKey: .isFavourite)
    }

    enum CodingKeys: String, CodingKey {
        case workoutName
        case workoutDescription
        case workoutExplanation
        case workoutImage
        case workoutDifficulty
        case isFavourite
    }
}
