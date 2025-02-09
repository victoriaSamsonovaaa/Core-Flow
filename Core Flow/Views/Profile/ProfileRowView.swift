//
//  ProfileRowView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 28.01.25.
//

import SwiftUI

struct ProfileRowView: View {
    
    let imageName: String
    let title: String
    let tint: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.large)
                .foregroundStyle(tint)
            
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.customBlue)
        }
    }
}

//#Preview {
//    ProfileRowView()
//}
