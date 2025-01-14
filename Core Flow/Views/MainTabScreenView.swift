//
//  HomeView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 9.01.25.
//

import SwiftUI

struct MainTabScreenView: View {
    
    enum Tab {
        case home, goals, settings
    }

    @State private var selectedTab: Tab = .home
    @Binding var isAuthenticated: Bool

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)

            WorkoutsView()
                .tabItem {
                    Label("Workouts", systemImage: "list.bullet")
                }
                .tag(Tab.goals)

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(Tab.settings)
        }
        .accentColor(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
    }
}


#Preview {
    MainTabScreenView(isAuthenticated: .constant(true))
}
