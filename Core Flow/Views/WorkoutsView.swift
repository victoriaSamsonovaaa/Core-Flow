//
//  GoalsView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 12.01.25.
//

import SwiftUI

struct WorkoutsView: View {
   
    @StateObject var viewModel = WorkoutsViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Here you can find most appropriate workouts for your needs")
                    .foregroundStyle(.customBlue)
                    .font(.custom("Cochin-bold", size: 27))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                
                if let workoutsByPart = viewModel.workoutsByPart {
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
                                            ExerciseCellView(exercise: exercise, imageHeight: 100, imageWidth: 200, ratingSize: 10, nameSize: 24, likeSize: 16, likePadding: 12)
                                        }
                                    }
                                }
                            }
                        }
                        .padding([.bottom, .leading], 10)
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .navigationTitle("Select your exercises!")
            .navigationBarTitleTextColor(.customBlue)
        }
        .task {
            do {
                try await viewModel.loadCurrentUser()
             //   print(viewModel.user)
            } catch {
                print("didn't got user: \(error)")
            }
        }
    }
}

#Preview {
    WorkoutsView()
}

