//
//  GoalsView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 12.01.25.
//

import SwiftUI

struct WorkoutsView: View {
    let workoutsByPart: WorkoutModel = Bundle.main.decode("workouts.json")
    
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
//                ForEach(workoutsByPart) { part in
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        
//                    }
//                }
            }
            .navigationTitle("Moonshot")
            .background(Color(#colorLiteral(red: 0.3328896165, green: 0.4141520262, blue: 0.3390924037, alpha: 1)))
        }
    }
}

#Preview {
    WorkoutsView()
}

