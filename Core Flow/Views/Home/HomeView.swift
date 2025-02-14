//
//  MainTabScreenView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 12.01.25.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var profileViewModel: ProfileViewModel
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
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Welcome")
                            .font(.largeTitle)
                            .padding()
                        
                        Spacer()
                        
                        Text(profileViewModel.user?.initials ?? "N/A")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.customBlue)
                            .frame(width: 70, height: 70)
                            .background(.gray.opacity(0.5))
                            .clipShape(.circle)
                        
                    }
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
                            ProgressRingView(progress: $calories, goal: 500, color: Color(red: 250 / 255, green: 17 / 255, blue: 79 / 255))
                            ProgressRingView(progress: $active, goal: 60, color: Color(red: 16 / 255, green: 255 / 255, blue: 0))
                                .padding(20)
                            ProgressRingView(progress: $stand, goal: 13, color: Color(red: 0 / 255, green: 255 / 255, blue: 276 / 255))
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
}

#Preview {
    HomeView()
        .environmentObject(ProfileViewModel())
}


