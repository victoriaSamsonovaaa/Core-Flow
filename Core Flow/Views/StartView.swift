//
//  ContentView.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 29.12.24.
//

import SwiftUI

struct StartView: View {

    @State private var showSignUp: Bool = false
    @State private var showSignIn: Bool = false
    var body: some View {
        VStack {
            Text("Let's Get Started")
                .font(.custom("Cochin-Bold", size: 40))
                .foregroundStyle(Color(#colorLiteral(red: 0.9121661782, green: 0.8284091949, blue: 0.773633182, alpha: 1)))
                .padding(.top, 120)
                .padding(.bottom, 400)
            Button("Sign Up") {
                showSignUp = true
            }
            .font(.custom("Cochin", size: 26))
            .foregroundStyle(Color(#colorLiteral(red: 0.9121661782, green: 0.8284091949, blue: 0.773633182, alpha: 1)))
            .frame(width: 360, height: 55)
            .background(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
            .cornerRadius(16)
            .padding(.bottom, 20)
            .sheet(isPresented: $showSignUp) {
                SignUpEmailView()
            }
            
            HStack {
                Text("Already have an account?")
                    .font(.custom("Cochin", size: 20))
                    .foregroundStyle(Color(#colorLiteral(red: 0.9121661782, green: 0.8284091949, blue: 0.773633182, alpha: 1)))
                Button("Sign In") {
                    showSignIn = true
                }
                .font(.custom("Cochin", size: 20))
                .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
                .fullScreenCover(isPresented: $showSignIn) {
                    SignInEmailView()
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.3328896165, green: 0.4141520262, blue: 0.3390924037, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    StartView()
}

//            HStack {
//                Rectangle()
//                    .frame(width: 150, height: 1)
//                    .overlay(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
//                    .opacity(0.3)
//                Text("Or")
//                    .foregroundStyle(Color(#colorLiteral(red: 0.9121661782, green: 0.8284091949, blue: 0.773633182, alpha: 1)))
//                    .font(.custom("Cochin", size: 20))
//                Rectangle()
//                    .frame(width: 150, height: 1)
//                    .overlay(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
//                    .opacity(0.3)
//            }
//            .padding(.bottom, 30)
