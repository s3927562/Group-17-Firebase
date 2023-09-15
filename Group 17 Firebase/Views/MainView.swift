//
//  EmptyView.swift
//  Group 17 Firebase
//
//  Created by Tung Tran Thanh on 13/09/2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var authenticator: Authenticator
    @StateObject private var userProfile = UserProfile()
    
    var body: some View {
        VStack {
            if (!userProfile.name.isEmpty) {
                Text("Welcome, \(userProfile.name)")
                
                Button {
                    authenticator.logOut()
                } label: {
                    Text("Log Out")
                        .modifier(ButtonSize())
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .animation(.default, value: userProfile.name.isEmpty)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
