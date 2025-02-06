//
//  ActivityLabelView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 6.02.25.
//

import SwiftUI

struct ActivityLabelView: View {
    var body: some View {
        ZStack {
            Color(.customBlue).opacity(0.3)
            
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Daily steps")
                            .font(.system(size: 16))
                            .foregroundStyle(.customBlue)
                        Text("Goal: 10.000")
                            .font(.system(size: 12))
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    
                    Image(systemName: "figure.walk")
                        .foregroundStyle(.green)
                }
                
                Text("6.234")
                    .font(.system(size: 24))
                    .foregroundStyle(.customBlue)
            }
            .padding()
        }
        .cornerRadius(15)
    }
}

#Preview {
    ActivityLabelView()
}
