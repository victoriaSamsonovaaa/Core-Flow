//
//  ActivityLabelView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 6.02.25.
//

import SwiftUI

struct Activity {
    let id: Int
    let title: String
    let subtitle: String
    let image: String
    let tintColor: Color
    let amount: String
}

struct ActivityLabelView: View {
    @State var activity: Activity
    var body: some View {
        ZStack {
            Color(.customBlue).opacity(0.3)
            
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(activity.title)
                            .font(.system(size: 16))
                            .foregroundStyle(.customBlue)
                        Text(activity.subtitle)
                            .font(.system(size: 12))
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    
                    Image(systemName: activity.image)
                        .foregroundStyle(activity.tintColor)
                }
                
                Text(activity.amount)
                    .font(.system(size: 24))
                    .foregroundStyle(.customBlue)
            }
            .padding()
        }
        .cornerRadius(15)
    }
}

#Preview {
    ActivityLabelView(activity: Activity(id: 0, title: "Daily stepss", subtitle: "Goal: 12.000", image: "figure.walk", tintColor: .green, amount: "6.893"))
}
