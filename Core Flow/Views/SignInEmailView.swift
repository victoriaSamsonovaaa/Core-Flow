//
//  SignInIView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 30.12.24.
//

import SwiftUI

struct SignInEmailView: View {
    @State private var viewModel = SignInEmailViewViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Email")
                .font(.custom("Cochin", size: 24))
                .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                .padding(.bottom, 4)
            CustomTextField(placeholder: "Enter your Email", text: $viewModel.email)
                .padding(.bottom, 40)
            
            Text("Password")
                .font(.custom("Cochin", size: 24))
                .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                .padding(.bottom, 4)
            CustomTextField(placeholder: "Enter your password", text: $viewModel.password)
                .padding(.bottom, 40)
            
            Button("Sign In") {
                
            }
            .font(.custom("Cochin", size: 26))
            .foregroundStyle(Color(#colorLiteral(red: 0.9121661782, green: 0.8284091949, blue: 0.773633182, alpha: 1)))
            .frame(width: 360, height: 55)
            .background(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
            .cornerRadius(16)
            .padding(.bottom, 20)
            
        }
        
        .padding()
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color(#colorLiteral(red: 0.9121661782, green: 0.8284091949, blue: 0.773633182, alpha: 1)).opacity(0.6))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.9121661782, green: 0.8284091949, blue: 0.773633182, alpha: 0.7578390731)))
    }
}

#Preview {
    SignInEmailView()
}
