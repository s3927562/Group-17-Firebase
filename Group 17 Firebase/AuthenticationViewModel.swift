//
//  AuthenticationViewModel.swift
//  Group 17 Firebase
//
//  Created by Tung Tran Thanh on 13/09/2023.
//

import Foundation
import Firebase

class Authenticator: ObservableObject {
    @Published var currentUser: User?
    
    init() {
        self.currentUser = Auth.auth().currentUser
    }
    
    func logIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self.currentUser = Auth.auth().currentUser
            }
        }
    }
    
    func register(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self.logIn(withEmail: email, password: password)
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
            self.currentUser = nil
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
