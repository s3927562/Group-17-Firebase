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
                var ref: DocumentReference? = nil
                ref = Firestore.firestore().collection("users").addDocument(data: [
                    "name": name,
                    "email": email,
                    "uid": self.currentUser!.uid
                ]) { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print(ref!.documentID)
                    }
                }
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
