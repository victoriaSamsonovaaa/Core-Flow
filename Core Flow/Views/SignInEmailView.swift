//
//  SignInIView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 30.12.24.
//

import SwiftUI

struct SignInEmailView: View {
    @State private var viewModel = SignInEmailViewViewModel()
    @Binding var isAuthenticated: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Welcome back")
                .font(.custom("Optima-Regular", size: 48))
                .bold()
                .foregroundStyle(Color.customBlue)
                .padding(.bottom, 22)
            
            VStack(alignment: .leading) {
                Text("Email")
                    .font(.custom("Cochin", size: 24))
                    .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                    .padding(.bottom, 4)
                CustomTextField(placeholder: "Enter your Email", text: $viewModel.email)
                    .padding(.bottom, 22)
                
                Text("Password")
                    .font(.custom("Cochin", size: 24))
                    .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                    .padding(.bottom, 4)
                CustomSecureField(placeholder: "Enter your password", text: $viewModel.password)
                    .padding(.bottom, 20)
                
                HStack {
                    Text("Forgot password?")
                        .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                        .font(.custom("Cochin-Bold", size: 20))
                    Button("Click Here") {
                        
                    }
                    .foregroundStyle(Color.black)
                    .font(.custom("Cochin-Bold", size: 20))
                }
                .padding(.bottom, 30)
            }
            .padding()

            Button {
                Task {
                    do {
                        try await viewModel.signIn()
                        isAuthenticated = true
                    } catch {
                        print("Error: \(error)")
                    }
                }
            } label: {
                Text("Sign In")
                    .font(.custom("Cochin", size: 26))
                    .foregroundStyle(Color(#colorLiteral(red: 0.9121661782, green: 0.8284091949, blue: 0.773633182, alpha: 1)))
                    .frame(width: 370, height: 55)
                    .background(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                    .cornerRadius(16)
                    .padding(.bottom, 20)
            }

            
            HStack {
                Rectangle()
                    .frame(width: 158, height: 1)
                    .overlay(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                    .opacity(0.3)
                Text("Or")
                    .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                    .font(.custom("Cochin", size: 20))
                Rectangle()
                    .frame(width: 158, height: 1)
                    .overlay(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                    .opacity(0.3)
                }
            .padding(.bottom, 10)
            
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Image("facebook")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .scaledToFit()
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "apple.logo")
                        .resizable()
                        .frame(width: 25.25, height: 30)
                        .scaledToFit()
                        .tint(Color.black)
                }
                .padding(.horizontal)
                
                Button {
                    
                } label: {
                    Image("google")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .scaledToFit()
                }
                Spacer()
            }
        }

        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.9121661782, green: 0.8284091949, blue: 0.773633182, alpha: 0.7578390731)))
    }
}

#Preview {
    SignInEmailView(isAuthenticated: .constant(false))
}
