//
//  SignUpView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 30.12.24.
//

import SwiftUI

struct SignUpEmailView: View {
    @StateObject private var viewModel = SignUpEmailViewViewModel()
    
    @Binding var isAuthenticated: Bool
    @State private var emailOutput: String = ""
    @State private var passwordOutput: String = ""
    @State private var secondPasswordOutput: String = ""

    var body: some View {
        VStack(alignment: .center) {
            Spacer() 

            Text("Create account")
                .font(.custom("Optima-Regular", size: 48))
                .bold()
                .foregroundStyle(Color.customBlue)
                .padding(.top, 30)
                .padding(.bottom, 22)

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
                    .padding(.bottom, 30)

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
                .padding(.bottom, 50)
            }
            .padding(.horizontal)
            
            Button {
                Task {
                    do {
                        try await viewModel.signUp()
                        isAuthenticated = true
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
//            Button("Sign Up") {
//                viewModel.signUp()
//                isAuthenticated = true
//            }
            //.disabled(viewModel.flag)


            HStack {
                Rectangle()
                    .frame(width: 120, height: 1)
                    .overlay(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                    .opacity(0.3)
                Text("Or")
                    .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                    .font(.custom("Cochin", size: 20))
                Rectangle()
                    .frame(width: 120, height: 1)
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
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.9121661782, green: 0.8284091949, blue: 0.773633182, alpha: 0.7578390731)))
    }
}

#Preview {
    NavigationStack {
        SignUpEmailView(isAuthenticated: .constant(false))
    }
}
