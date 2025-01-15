//
//  GoalsView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 12.01.25.
//

import SwiftUI

struct WorkoutsView: View {
    let workoutsByPart: WorkoutModel = Bundle.main.decode("workouts.json")
    
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(workoutsByPart.muscle) { muscle in
                    VStack(alignment: .leading) {
                        Text(muscle.name)
                            .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                            .font(.custom("Cochin-bold", size: 32))
                            .padding(.vertical, 10)
                        
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
                                                .padding()
                                            
                                            VStack {
                                                Text(exercise.workoutName)
                                                    .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                                                    .font(.custom("Cochin-bold", size: 24))
                                                
                                                Text("\(exercise.workoutDifficulty) / 5")
                                                    .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                                                    .font(.custom("Cochin-bold", size: 24))
                                                
                                            }
                                            .padding(.vertical)
                                            .frame(maxWidth: .infinity)
                                            .background(.customBeige)
                                        }
                                        .clipShape(.rect(cornerRadius: 10))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.customBlue)
                                        )
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Text("Select yuor exercises!")
//                        .font(.largeTitle)
//                        .fontDesign(.rounded)
//                }
//            }
            .navigationTitle("Select yuor exercises!")
            .navigationBarTitleTextColor(.customBlue)
        }
    }

}

#Preview {
    WorkoutsView()
}

