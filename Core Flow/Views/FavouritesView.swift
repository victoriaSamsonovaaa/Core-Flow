//
//  FavouritesView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 31.01.25.
//

import SwiftUI

struct FavouritesView: View {
    
    @EnvironmentObject var userModel: ExerciseViewModel
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        VStack {
            if userModel.favWorkouts.isEmpty {
                VStack {
                    Text("You don't have favourite workouts")
                        .foregroundStyle(.customBlue)
                        .font(.custom("Cochin-bold", size: 27))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            else {
                NavigationStack {
                    ScrollView {
                        Text("Favourite workouts")
                            .foregroundStyle(.customBlue)
                            .font(.custom("Cochin-bold", size: 27))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                        LazyVGrid(columns: columns) {
                            ForEach(userModel.favWorkouts) { work in
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
        }
        .onAppear() {
         //   fav = userModel.user?.favWorkouts ?? []
            Task {
                try await userModel.fetchFavouriteExercises()
            }
        }
    }
}

//#Preview {
//    FavouritesView()
//}
