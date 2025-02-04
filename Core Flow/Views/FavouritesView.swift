//
//  FavouritesView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 31.01.25.
//

import SwiftUI

struct FavouritesView: View {
    
    @EnvironmentObject var userModel: ProfileViewModel
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
  //  let favWorkouts: WorkoutModel = Bundle.main.decode("workouts.json")
    
    var body: some View {
        if let favWorkouts = userModel.user?.favWorkouts {
            NavigationStack {
                ScrollView {
                    Text("Favourite workouts")
                        .foregroundStyle(.customBlue)
                        .font(.custom("Cochin-bold", size: 27))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                    LazyVGrid(columns: columns) {
                        ForEach(favWorkouts) { work in
                            NavigationLink {
                                ExerciseView(exercise: work, muscleName: "aaa")
                            } label: {
                                ExerciseCellView(exercise: work, imageHeight: 80, imageWidth: 150, ratingSize: 8, nameSize: 16, likeSize: 12, likePadding: 10)
                            }
                        }
                    }
                }
            }
        }
        else {
            VStack {
                Text("You don't have favourite wirkouts")
                    .foregroundStyle(.customBlue)
                    .font(.custom("Cochin-bold", size: 27))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

//#Preview {
//    FavouritesView()
//}
