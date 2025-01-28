//
//  ExerciseCellView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 28.01.25.
//

import SwiftUI

struct ExerciseCellView: View {
    @StateObject var viewModel = WorkoutsViewModel()
    let exercise: ExerciseModel
  //  var isFav: Bool = false
    
    var body: some View {
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
                     //   isFav.toggle()
                        Task {
                            try await viewModel.addToFavourites(exercise: exercise)
                        }
                    } label: {
                        Image(systemName: /*isFav ? "heart.fill" :*/ "heart" )
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
//
//#Preview {
//    ExerciseCellView()
//}
