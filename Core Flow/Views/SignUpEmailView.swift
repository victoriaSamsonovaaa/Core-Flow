//
//  SignUpView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 30.12.24.
//

import SwiftUI

import SwiftUI

struct SignUpEmailView: View {
    @StateObject private var viewModel = SignUpEmailViewViewModel()
    @State private var emailOutput: String = ""
    @State private var passwordOutput: String = ""
    @State private var secondPasswordOutput: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Name")
                .font(.custom("Cochin-Bold", size: 24))
                .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                .padding(.bottom, 4)
            CustomTextField(placeholder: "Enter your Name", text: $viewModel.name)
                .padding(.bottom, 50)

            Text("Email")
                .font(.custom("Cochin-Bold", size: 24))
                .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                .padding(.bottom, 4)
            CustomTextField(placeholder: "Enter your Email", text: $viewModel.email)
                .onChange(of: viewModel.email) { newValue in
                    emailOutput = viewModel.validateEmail(email: newValue).1
                }

            Text(emailOutput)
                .padding(.bottom, 40)
                .font(.custom("Cochin-Bold", size: 20))
                .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)).secondary)

            Text("Password")
                .font(.custom("Cochin-Bold", size: 24))
                .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                .padding(.bottom, 4)
            CustomSecureField(placeholder: "Create password", text: $viewModel.password)
                .onChange(of: viewModel.password) { newValue in
                    passwordOutput = viewModel.validatePassword(password: newValue).1
                }
            Text(passwordOutput)
                .padding(.bottom, 40)
                .font(.custom("Cochin-Bold", size: 20))
                .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)).secondary)

            Text("Password")
                .font(.custom("Cochin-Bold", size: 24))
                .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                .padding(.bottom, 4)
            CustomSecureField(placeholder: "Repeat password", text: $viewModel.secondPassword)
                .onChange(of: viewModel.secondPassword) { newValue in
                    secondPasswordOutput = viewModel.comparePasswords(password: viewModel.password, confirmPassword: viewModel.secondPassword).1
                }
            Text(secondPasswordOutput)
                .padding(.bottom, 60)
                .font(.custom("Cochin-Bold", size: 20))
                .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)).secondary)

            Button("Create an account") {
                viewModel.signUp()
            }
            .font(.custom("Cochin", size: 26))
            .foregroundStyle(Color(#colorLiteral(red: 0.9121661782, green: 0.8284091949, blue: 0.773633182, alpha: 1)))
            .frame(maxWidth: 370, maxHeight: 55)
            .background(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
            .cornerRadius(16)
            .padding(.bottom, 10)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.9121661782, green: 0.8284091949, blue: 0.773633182, alpha: 0.7578390731)))
    }
}

#Preview {
    NavigationStack {
        SignUpEmailView()
    }
}
