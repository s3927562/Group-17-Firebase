//
//  ContentView.swift
//  Group 17 Firebase
//
//  Created by Tung Tran Thanh on 12/09/2023.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject private var authenticator: Authenticator
    @State private var path = NavigationPath()
    @State private var isLoggedIn = false
    @State private var showSheet: WelcomeSheet?
    private enum WelcomeSheet: String, Identifiable {
        case logIn, register
        
        var id: String { rawValue }
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Hello, world!")
                    .font(.largeTitle)
                Button {
                    showSheet = .logIn
                } label: {
                    Text("Log In")
                        .modifier(ButtonSize())
                }
                .buttonStyle(.borderedProminent)
                
                Button {
                    showSheet = .register
                } label: {
                    Text("Register")
                        .modifier(ButtonSize())
                }
                .buttonStyle(.bordered)
                
                .navigationDestination(isPresented: $isLoggedIn) {
                    EmptyView()
                }
            }
            .padding()
            
            .sheet(item: $showSheet) { sheet in
                switch sheet {
                case .logIn: LogInSheet()
                case .register: RegisterSheet()
                }
            }
            
            .onAppear {
                if let _ = authenticator.currentUser {
                    isLoggedIn = true
                } else {
                    isLoggedIn = false
                }
            }
            
            .onChange(of: authenticator.currentUser) { currentUser in
                if let _ = currentUser {
                    isLoggedIn = true
                } else {
                    isLoggedIn = false
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
