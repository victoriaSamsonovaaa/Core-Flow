//
//  SignInIView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 30.12.24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices
import UIKit

struct SignInView: View {
    @State private var viewModel = SignInViewModel()
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
                CustomTextField(text: $viewModel.email, placeholder: "Enter your Email")
                    .padding(.bottom, 22)
                
                Text("Password")
                    .font(.custom("Cochin", size: 24))
                    .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                    .padding(.bottom, 4)
                CustomSecureField(text: $viewModel.password, placeholder: "Enter your password")
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
            
            Button(action: {
                Task {
                    do {
                        try await viewModel.signUpWithApple()
                        isAuthenticated = true
                    } catch {
                        
                    }
                }
            }, label: {
                SignInWithAppleButtonViewRepresentable(type: .default, style: .black)
                    .allowsHitTesting(false)
            })
            .frame(width: 370, height: 45)
            .padding(.bottom, 8)

            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .light, style: .wide, state: .normal)) {
                Task {
                    do {
                        try await viewModel.signUpWithGoogle()
                        isAuthenticated = true
                    } catch {
                        
                    }
                }
            }
            .frame(width: 370, height: 45)
            .buttonBorderShape(.roundedRectangle(radius: 20))
        }

        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.9121661782, green: 0.8284091949, blue: 0.773633182, alpha: 0.7578390731)))
    }
}

#Preview {
    SignInView(isAuthenticated: .constant(false))
}
