//
//  GoalsView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 12.01.25.
//

import SwiftUI

struct WorkoutsView: View {
    let workoutsByPart: WorkoutModel = Bundle.main.decode("workouts.json")
    @StateObject var viewModel = WorkoutsViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Here you can find most appropriate workouts for your needs")
                    .foregroundStyle(.customBlue)
                    .font(.custom("Cochin-bold", size: 27))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
//                Rectangle()
//                    .frame(height: 1)
//                    .foregroundStyle(.customBlue.secondary)
//                    .padding(6)
                
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
                                        ExerciseView(exercise: exercise)
                                    } label: {
                                        VStack {
                                            Image("cat_cow.jpg")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 200, height: 100)
                                                .padding(12)
                                                .overlay(alignment: .topLeading) {
                                                    RatingView(rating: exercise.workoutDifficulty, frame: 10, space: 2)
                                                        .padding(12)
                                                }
                                                .overlay(alignment: .topTrailing) {
                                                    Button {
                                                        
                                                    } label: {
                                                        Image(systemName: "heart" )
                                                            .padding(12)
                                                    }
                                                }
                                            
                                            VStack {
                                                Text(exercise.workoutName)
                                                    .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                                                    .font(.custom("Cochin-bold", size: 24))
                                                    
                                            }
                                            .padding(.vertical, 8)
                                            .frame(maxWidth: .infinity)
                                            .background(.customBeige).opacity(0.8)
                                        }
                                        .background(.white)
                                        .clipShape(.rect(cornerRadius: 13))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 13)
                                                .stroke(.customBlue, lineWidth: 2)
                                        )
                                        .padding([.horizontal, .top], 2)
                                        .padding(.bottom, 20)
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

