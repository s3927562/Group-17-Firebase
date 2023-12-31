//
//  LogInSheet.swift
//  Group 17 Firebase
//
//  Created by Tung Tran Thanh on 12/09/2023.
//

import SwiftUI

struct LogInSheet: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var authenticator: Authenticator
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Text("Log In")
                .font(.largeTitle)
                .bold()
            
            TextField("Email", text: $email, prompt: Text("Email"))
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                .textFieldStyle(CustomRoundedBorderTextFieldStyle(withImage: "envelope.fill"))
            SecureField("Password", text: $password, prompt: Text("Password"))
                .textFieldStyle(CustomRoundedBorderTextFieldStyle(withImage: "key.horizontal.fill"))
            
            Text(authenticator.authError ?? "")
                .font(.caption)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
            
            Section {
                Button {
                    authenticator.logIn(withEmail: email, password: password)
                } label: {
                    Text("Log In")
                        .modifier(ButtonSize())
                }
                .buttonStyle(.borderedProminent)
                
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .modifier(ButtonSize())
                }
                .buttonStyle(.bordered)
            }
            
            .onChange(of: authenticator.currentUser) { _ in
                dismiss()
            }
        }
        .padding()
    }
}

struct LogInSheet_Previews: PreviewProvider {
    @StateObject private static var authenticator = Authenticator()
    
    static var previews: some View {
        LogInSheet()
            .environmentObject(authenticator)
    }
}
