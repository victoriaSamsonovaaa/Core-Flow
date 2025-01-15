//
//  ViewExtensions.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 15.01.25.
//

import Foundation
import SwiftUI


extension View {
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        return self
    }
}


