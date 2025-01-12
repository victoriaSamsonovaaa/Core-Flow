//
//  GoalsView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 12.01.25.
//

import SwiftUI

struct GoalsView: View {
    var body: some View {
        VStack {
            Text("Goals")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.3328896165, green: 0.4141520262, blue: 0.3390924037, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    GoalsView()
}
