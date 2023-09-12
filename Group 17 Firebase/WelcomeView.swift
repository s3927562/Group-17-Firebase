//
//  ContentView.swift
//  Group 17 Firebase
//
//  Created by Tung Tran Thanh on 12/09/2023.
//

import SwiftUI

struct WelcomeView: View {
    @State private var showSheet: WelcomeSheet?
    private enum WelcomeSheet: String, Identifiable {
        case logIn, register
        
        var id: String { rawValue }
    }
    
    var body: some View {
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

        }
        .padding()
        
        .sheet(item: $showSheet) { sheet in
            switch sheet {
            case .logIn: LogInSheet()
            case .register: RegisterSheet()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
