//
//  EmptyView.swift
//  Group 17 Firebase
//
//  Created by Tung Tran Thanh on 13/09/2023.
//

import SwiftUI

struct EmptyView: View {
    @EnvironmentObject private var authenticator: Authenticator
    
    var body: some View {
        VStack {
            Text("Welcome, \()")
            Button {
                authenticator.logOut()
            } label: {
                Text("Log Out")
                    .modifier(ButtonSize())
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
