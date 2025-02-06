//
//  MainTabScreenView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 12.01.25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)){
                ActivityLabelView()
                ActivityLabelView()
            }
            .padding(.horizontal)
        }

    }
}

#Preview {
    HomeView()
}

//                Text("okkkk")
//                    .font(.largeTitle)
//                    .padding()
//
//                HStack {
//                    VStack {
//                        VStack(alignment: .leading, spacing: 6) {
//                            Text("Calories")
//                                .font(.callout)
//                                .bold()
//                                .foregroundStyle(.red)
//                            Text("100 kcal")
//                                .bold()
//                        }
//                        .padding(.bottom)
//
//                        VStack(alignment: .leading, spacing: 6) {
//                            Text("Active")
//                                .font(.callout)
//                                .bold()
//                                .foregroundStyle(.green)
//                            Text("52 mins")
//                                .bold()
//                        }
//                        .padding(.bottom)
//
//                        VStack(alignment: .leading, spacing: 6) {
//                            Text("Stand")
//                                .font(.callout)
//                                .bold()
//                                .foregroundStyle(.blue)
//                            Text("8 hours")
//                                .bold()
//                        }
//                        .padding(.bottom)
//                    }
//                }
