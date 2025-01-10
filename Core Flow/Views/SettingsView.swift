//
//  SettingsView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 31.12.24.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewViewModel()
    @Binding var isAuthenticated: Bool
    
    var body: some View {
        Button("Log out") {
            Task {
                do {
                    try viewModel.signOut()
                    isAuthenticated = false
                }
            }
        }
        .font(.custom("Cochin", size: 26))
        .foregroundStyle(Color(#colorLiteral(red: 0.9121661782, green: 0.8284091949, blue: 0.773633182, alpha: 1)))
        .frame(width: 360, height: 55)
        .background(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
        .cornerRadius(16)
        .padding(.bottom, 30)
        
        
        Button("Reset password") {
            Task {
                do {
                    try await viewModel.resetPassword()
                }
            }
        }
        .font(.custom("Cochin", size: 26))
        .foregroundStyle(Color(#colorLiteral(red: 0.9121661782, green: 0.8284091949, blue: 0.773633182, alpha: 1)))
        .frame(width: 360, height: 55)
        .background(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
        .cornerRadius(16)
        .padding(.bottom, 20)
    }
}

#Preview {
    SettingsView(isAuthenticated: .constant(false))
}
