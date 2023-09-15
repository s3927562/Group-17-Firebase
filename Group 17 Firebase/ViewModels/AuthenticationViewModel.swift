//
//  AuthenticationViewModel.swift
//  Group 17 Firebase
//
//  Created by Tung Tran Thanh on 13/09/2023.
//

import Foundation
import Firebase
import SwiftUI

class Authenticator: ObservableObject {
    @Published var currentUser: User?
    @Published var authError: String?
    
    init() {
        self.currentUser = Auth.auth().currentUser
    }
    
    func logIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.authError = error.localizedDescription
            } else {
                self.currentUser = authResult?.user
                self.authError = nil
            }
        }
    }
    
    func register(withEmail email: String, password: String, name: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.authError = error.localizedDescription
            } else {
                self.currentUser = authResult?.user
                self.authError = nil
                let db = Firestore.firestore()
                let usersRef = db.collection("users")
                usersRef.document("\(self.currentUser!.uid)").setData([
                    "name": name,
                    "email": email
                ])
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
            self.currentUser = Auth.auth().currentUser
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
