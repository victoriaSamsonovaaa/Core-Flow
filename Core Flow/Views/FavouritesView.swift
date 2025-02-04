//
//  FavouritesView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 31.01.25.
//

import SwiftUI

struct FavouritesView: View {
    
    @EnvironmentObject var user: ProfileViewModel
//    @State private var favWorkouts
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Favourite workouts")
                    .foregroundStyle(.customBlue)
                    .font(.custom("Cochin-bold", size: 27))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                LazyVGrid(columns: columns) {
                    
                }
            }
        }
        
    }
}

#Preview {
    FavouritesView()
}
