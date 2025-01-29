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
    let muscleName: String
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("\(muscleName) muscles group")
                        .font(.largeTitle)
                        .foregroundStyle(.customBlue)
                    
                    Image(exercise.workoutImage)
                        .resizable()
                        .scaledToFit()
                        .padding(.top)
                    
                    Text(exercise.workoutName)
                        .font(.title3)
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
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundStyle(.customBlue)
                            .padding(.vertical)
                    }
                    .padding(.horizontal)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem {
                            Menu {
                                ShareLink(item: Image(exercise.workoutImage), preview: SharePreview("Exercise", image: Image(exercise.workoutImage))) {
                                    Label("Share", systemImage: "square.and.arrow.up")
                                }
                                
                                Divider()
                                
                                Button {
                                    
                                } label: {
                                    Label("Add to Favorites", systemImage: "heart")
                                }
                                
                                Button(role: .destructive) {
                                    
                                } label: {
                                    Label("Hide this exercise", systemImage: "eye.slash")
                                }
                                
                            } label: {
                                Label("Menu", systemImage: "ellipsis.circle")
                            }
                        }
                    }
                    Text("Exercise difficulty")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    RatingView(rating: exercise.workoutDifficulty, frame: 20, space: 8)
                }
            }
            .tint(.customGreen)
        }
    }
}

#Preview {
    let workoutsByPart: WorkoutModel = Bundle.main.decode("workouts.json")
    return ExerciseView(exercise: workoutsByPart.muscle[0].exercises[4], muscleName: "Back")
}
