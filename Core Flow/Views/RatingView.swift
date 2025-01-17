//
//  RatingView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 17.01.25.
//

import SwiftUI

struct RatingView: View {
    var rating: Int
    var frame: CGFloat
    var space: CGFloat
    
    var maximumRating = 5
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack(spacing: space) {
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Image(systemName: "star.fill")
                    .resizable() // Делает Image resizable
                    .scaledToFit() // Делает Image масштабируемой по её фрейму
                    .frame(width: frame, height: frame)
                    .foregroundStyle(number > rating ? offColor : onColor)
            }
        }
    }
    
    
    //                Button {
    //                    rating = number
    //                } label: {
    //                    image(for: number)
    //                        .foregroundStyle(number > rating ? offColor : onColor)
    //                }
    
//    func image(for number: Int) -> Image {
//        if number > rating {
//            offImage ?? onImage
//        } else {
//            onImage
//        }
//    }
}

#Preview {
    RatingView(rating: 2, frame: 10, space: 2)
}
