//
//  RegisterSheet.swift
//  Group 17 Firebase
//
//  Created by Tung Tran Thanh on 12/09/2023.
//

import SwiftUI

struct RegisterSheet: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("Name", text: $name, prompt: Text("Name"))
                .autocorrectionDisabled(true)
                .textFieldStyle(CustomRoundedBorderTextFieldStyle())
            TextField("Email", text: $email, prompt: Text("Email"))
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                .textFieldStyle(CustomRoundedBorderTextFieldStyle())
            SecureField("Password", text: $password, prompt: Text("Password"))
                .textFieldStyle(CustomRoundedBorderTextFieldStyle())
            
            Section {
                Button {
                    
                } label: {
                    Text("Register")
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
        }
        .padding()
    }
}

struct RegisterSheet_Previews: PreviewProvider {
    static var previews: some View {
        RegisterSheet()
    }
}
