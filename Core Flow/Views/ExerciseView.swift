//
//  WorkoutView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 13.01.25.
//

import SwiftUI

struct ExerciseView: View {
    let exercise: ExerciseModel
    
    var body: some View {
        ScrollView {
            VStack {
                Image(exercise.workoutImage)
            }
        }
    }
}

#Preview {
    let workouts: WorkoutModel = Bundle.main.decode("workouts.json")
    return ExerciseView(exercise: workouts.back[4])
}
