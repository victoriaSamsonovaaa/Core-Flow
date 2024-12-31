//
//  SettingsViewViewModel.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 31.12.24.
//

import Foundation

class SettingsViewViewModel: ObservableObject {
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}
