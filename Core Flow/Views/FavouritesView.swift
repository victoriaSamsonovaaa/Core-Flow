//
//  FavouritesView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 31.01.25.
//

import SwiftUI

struct FavouritesView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    Text("Favourite workouts")
                        .foregroundStyle(.customBlue)
                        .font(.custom("Cochin-bold", size: 27))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        
    }
}

#Preview {
    FavouritesView()
}
