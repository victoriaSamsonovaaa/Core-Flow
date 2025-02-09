//
//  ProgressRingView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 7.02.25.
//

import SwiftUI

struct ProgressRingView: View {
    @Binding var progress: Int
    var goal: Int
    var color: Color
    private let width: CGFloat = 20
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.3), lineWidth: width)
            
//            Circle()
//                .trim(from: 0, to: min(CGFloat(progress) / CGFloat(goal), 1.0))
//                .stroke(
//                    AngularGradient(
//                        gradient: Gradient(colors: [color.opacity(0.3), color]),
//                        center: .center,
//                        startAngle: .degrees(-90),
//                        endAngle: .degrees(Double(min((progress / goal) * 360, 360)))
//                    ),
//                    style: StrokeStyle(lineWidth: width, lineCap: .round)
//                )
//                .rotationEffect(.degrees(-90))
//                .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 0)
            
            if progress > goal {
                Circle()
                 //   .trim(from: 0, to: min(CGFloat(progress - goal) / CGFloat(goal), 1.0))
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: [color.opacity(0.3), color.opacity(0.8)]),
                            center: .center,
                            startAngle: .degrees(-90),
                            endAngle: .degrees(Double(min(((progress - goal) / goal) * 360, 360)))
                        ),
                        style: StrokeStyle(lineWidth: width, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
            }

        }
        .padding()
    }
}

#Preview {
    ProgressRingView(progress: .constant(310), goal: 200, color: .red)
}
