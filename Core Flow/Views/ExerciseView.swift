//
//  WorkoutView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 13.01.25.
//

import SwiftUI

struct ExerciseView: View {
    let exercise: ExerciseModel
    let workoutsByPart: WorkoutModel = Bundle.main.decode("workouts.json")
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image(exercise.workoutImage)
                        .resizable()
                        .scaledToFit()
                        .padding(.top)
                        .padding(.bottom, 30)
                    
                    Text(exercise.workoutName)
                        .font(.title3.bold().italic())
                        .foregroundStyle(.customBlue)
                    
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundStyle(.customBlue)
                            .padding(.vertical)
                        
                        Text("Exercise description")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        Text(exercise.workoutDescription)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundStyle(.customBlue)
                            .padding(.vertical)
                        Text("Exercise explanation")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        Text(exercise.workoutExplanation)
                        
                    }
                    .padding(.horizontal)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Like", systemImage: "heart") {
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let workoutsByPart: WorkoutModel = Bundle.main.decode("workouts.json")
    return ExerciseView(exercise: workoutsByPart.muscle[0].exercises[4])
}
