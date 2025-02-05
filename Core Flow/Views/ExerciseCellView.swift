//
//  ExerciseCellView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 28.01.25.
//

import SwiftUI

struct ExerciseCellView: View {
    
    @EnvironmentObject var viewModel: ExerciseViewModel
    @State private var isFavourite: Bool
    let exercise: ExerciseModel
    var imageHeight: CGFloat
    var imageWidth: CGFloat
    var ratingSize: CGFloat
    var nameSize: CGFloat
    var likeSize: CGFloat
    var likePadding: CGFloat

    init(exercise: ExerciseModel, imageHeight: CGFloat, imageWidth: CGFloat, ratingSize: CGFloat, nameSize: CGFloat, likeSize: CGFloat, likePadding: CGFloat) {
        self.exercise = exercise
        _isFavourite = State(initialValue: exercise.isFavourite)
        self.imageHeight = imageHeight
        self.imageWidth = imageWidth
        self.ratingSize = ratingSize
        self.nameSize = nameSize
        self.likeSize = likeSize
        self.likePadding = likePadding
    }
    
    var body: some View {
        VStack {
            Image("cat_cow.jpg")
                .resizable()
                .scaledToFit()
                .frame(width: imageWidth, height: imageHeight)
                .padding(12)
                .overlay(alignment: .topLeading) {
                    RatingView(rating: exercise.workoutDifficulty, frame: ratingSize, space: 2)
                        .padding(likePadding)
                }
                .overlay(alignment: .topTrailing) {
                    Button {
                        Task {
                            isFavourite.toggle()
                            try await viewModel.pressHeart(exercise: exercise)
                        }
                    } label: {
                        Image(systemName: isFavourite ? "heart.fill" : "heart" )
                            .font(.system(size: likeSize))
                            .padding(likePadding)
                            .tint(.customBlue)
                    }
                }
            
            VStack {
                Text(exercise.workoutName)
                    .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                    .font(.custom("Cochin-bold", size: nameSize))
                    
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

#Preview {
    ExerciseCellView(exercise: ExerciseModel(workoutName: "aaa", workoutDescription: "aaaaaaaaaa", workoutExplanation: "sssssssssss", workoutImage: "", workoutDifficulty: 4), imageHeight: 100, imageWidth: 200, ratingSize: 10, nameSize: 24, likeSize: 16, likePadding: 12)
}

