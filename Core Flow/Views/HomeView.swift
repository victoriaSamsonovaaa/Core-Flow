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
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
    //            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)){
    //                ActivityLabelView()
    //                ActivityLabelView()
    //            }
    //            .padding(.horizontal)
                
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
                }
            }
        }
    }
}

#Preview {
    HomeView()
}


