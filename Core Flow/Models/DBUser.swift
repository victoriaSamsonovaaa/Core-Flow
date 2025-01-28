//
//  DBUser.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 28.01.25.
//

import Foundation

struct DBUser: Codable {
    let fullname: String
    let userid: String
    let email: String?
    let dataCreated: Date?
    var favWorkouts: [ExerciseModel]
    
    init(auth: AuthDataResultModel, fullName: String, favourites: [ExerciseModel]) {
        self.fullname = fullName
        self.userid = auth.uid
        self.email = auth.email
        self.dataCreated = Date()
        self.favWorkouts = favourites
    }
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}
