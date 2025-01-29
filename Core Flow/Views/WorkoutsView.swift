//
//  GoalsView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 12.01.25.
//

import SwiftUI

struct WorkoutsView: View {
    let workoutsByPart: WorkoutModel = Bundle.main.decode("workouts.json")
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Here you can find most appropriate workouts for your needs")
                    .foregroundStyle(.customBlue)
                    .font(.custom("Cochin-bold", size: 27))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                
                ForEach(workoutsByPart.muscle) { muscle in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(muscle.name)
                                .font(.custom("Cochin-bold", size: 28))
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.customBlue.secondary)
                                .padding(.horizontal, 6)
                            
                            Button {
                                
                            } label: {
                                Text("View all")
                                    .font(.custom("Cochin-bold", size: 20))
                            }
                        }
                        .foregroundStyle(.customGreen)
                        .padding(.horizontal, 6)
                        
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(muscle.exercises) { exercise in
                                    NavigationLink {
                                        ExerciseView(exercise: exercise, muscleName: muscle.name)
                                    } label: {
                                        ExerciseCellView(exercise: exercise)
                                    }
                                }
                            }
                        }
                    }
                    .padding([.bottom, .leading], 10)
                    .frame(maxWidth: .infinity)
                }
            }
            .navigationTitle("Select your exercises!")
            .navigationBarTitleTextColor(.customBlue)
            //   .background(.customBlue)
        }
    }
}

#Preview {
    WorkoutsView()
}

