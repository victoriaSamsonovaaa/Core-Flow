//
//  SignUpView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 30.12.24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices
import UIKit

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    
    @Binding var isAuthenticated: Bool
    @State private var emailOutput: String = ""
    @State private var passwordOutput: String = ""
    @State private var secondPasswordOutput: String = ""
    @State private var isSuccessfully: Bool = false

    var body: some View {
        VStack(alignment: .center) {
            Spacer() 

            Text("Create account")
                .font(.custom("Optima-Regular", size: 48))
                .bold()
                .foregroundStyle(Color.customBlue)
                .padding(.top, 30)
                .padding(.bottom, 20)

            VStack(alignment: .leading) {
                Text("Name")
                    .font(.custom("Cochin-Bold", size: 24))
                    .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                    .padding(.bottom, 2)
                CustomTextField(placeholder: "Enter your Name", text: $viewModel.name)
                    .padding(.bottom, 22)

                Text("Email")
                    .font(.custom("Cochin-Bold", size: 24))
                    .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                    .padding(.bottom, 2)
                CustomTextField(placeholder: "Enter your Email", text: $viewModel.email)
                    .padding(.bottom, 22)

                Text("Password")
                    .font(.custom("Cochin-Bold", size: 24))
                    .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                    .padding(.bottom, 2)
                CustomSecureField(placeholder: "Create password", text: $viewModel.password)
                    .padding(.bottom, 20)

                Toggle(isOn: $viewModel.isAgree) {
                    HStack {
                        Text("Agree with")
                            .font(.custom("Cochin", size: 20))
                            .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                        Text("Terms & Privacy policy")
                            .font(.custom("Cochin", size: 20))
                            .foregroundStyle(Color.black)
                            .bold()
                    }
                }
                .tint(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                .padding(.bottom, 30)
            }
            .padding(.horizontal)
            
            Button {
                Task {
                    do {
                        try await viewModel.signUp()
                 //       isAuthenticated = true
                        isSuccessfully = true
                    } catch {
                        print("Error: \(error)")
                    }
                }
            } label: {
                Text("Sign Up")
                    .font(.custom("Cochin", size: 26))
                    .foregroundStyle(Color(#colorLiteral(red: 0.9121661782, green: 0.8284091949, blue: 0.773633182, alpha: 1)))
                    .frame(maxWidth: 370, minHeight: 55)
                    .background(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                    .cornerRadius(16)
                    .padding(.bottom, 20)
            }


            HStack {
                Rectangle()
                    .frame(width: 160, height: 1)
                    .overlay(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                    .opacity(0.3)
                Text("Or")
                    .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                    .font(.custom("Cochin", size: 20))
                Rectangle()
                    .frame(width: 160, height: 1)
                    .overlay(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                    .opacity(0.3)
            }
            .padding(.bottom, 20)
            
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
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.9121661782, green: 0.8284091949, blue: 0.773633182, alpha: 0.7578390731)))
        .alert(isPresented: $isSuccessfully) {
                 Alert(
                     title: Text("Great!"),
                     message: Text("Your account has been successfully created."),
                     dismissButton: .default(Text("OK")) {
                         DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                             isAuthenticated = true
                         }
                     }
                 )
             }
    }
}



#Preview {
    NavigationStack {
        SignUpView(isAuthenticated: .constant(false))
    }
}
