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
            
            Circle()
                .trim(from: 0, to: CGFloat(progress) / CGFloat(goal))
                .stroke(color, style: StrokeStyle(lineWidth: width, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .shadow(color: .gray, radius: 6)
                
        }
        .padding()
    }
}

#Preview {
    ProgressRingView(progress: .constant(100), goal: 200, color: .red)
}
