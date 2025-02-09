//
//  CustomTextField.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 30.12.24.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField("", text: $text, prompt: Text(placeholder).foregroundColor(Color.gray))
            .font(.custom("Cochin", size: 20))
            .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
            .padding()
            .background(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)).opacity(0.3))
            .cornerRadius(14)
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
            .frame(maxWidth: 370)
    }
}



struct CustomSecureField: View {
    
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        SecureField("", text: $text, prompt: Text(placeholder).foregroundColor(Color.gray))
            .font(.custom("Cochin", size: 20))
            .foregroundStyle(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)))
            .padding()
            .background(Color(#colorLiteral(red: 0.09077811986, green: 0.09625732154, blue: 0.2869860828, alpha: 0.7636585884)).opacity(0.3))
            .cornerRadius(14)
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
    }
}
