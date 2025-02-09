//
//  MainTabScreenView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 12.01.25.
//

import SwiftUI

struct HomeView: View {
    
    @State var calories: Int = 120
    @State var active: Int = 10
    @State var stand: Int = 15
    
    var mockActiv = [
        Activity(id: 0, title: "Daily stepss", subtitle: "Goal: 12.000", image: "figure.walk", tintColor: .green, amount: "6.893"),
        Activity(id: 1, title: "Daily stepss", subtitle: "Goal: 12.000", image: "figure.walk", tintColor: .red, amount: "943"),
        Activity(id: 2, title: "Daily stepss", subtitle: "Goal: 12.000", image: "figure.walk", tintColor: .purple, amount: "8.567"),
        Activity(id: 3, title: "Daily stepss", subtitle: "Goal: 12.000", image: "figure.walk", tintColor: .blue, amount: "1.032")
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Welcome")
                    .font(.largeTitle)
                    .padding()

                HStack {
                    Spacer()
                    
                    VStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Calories")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.red)
                            Text("\(calories) kcal")
                                .bold()
                        }
                        .padding(.bottom)

                        VStack(alignment: .leading, spacing: 6) {
                            Text("Active")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.green)
                            Text("\(active) mins")
                                .bold()
                        }
                        .padding(.bottom)

                        VStack(alignment: .leading, spacing: 6) {
                            Text("Stand")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.blue)
                            Text("\(stand) hours")
                                .bold()
                        }
                        .padding(.bottom)
                    }
                    
                    Spacer()
                    
                    ZStack {
                        ProgressRingView(progress: $calories, goal: 500, color: .red)
                        ProgressRingView(progress: $active, goal: 60, color: .green)
                            .padding(20)
                        ProgressRingView(progress: $stand, goal: 13, color: .blue)
                            .padding(40)
                    }
                    .padding(.horizontal)
                }
                .padding()
                
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                    ForEach(mockActiv, id: \.id) { act in
                        ActivityLabelView(activity: act)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    HomeView()
}


