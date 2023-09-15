//
//  UserViewModel.swift
//  Group 17 Firebase
//
//  Created by Tung Tran Thanh on 15/09/2023.
//

import Foundation
import Firebase

class UserProfile: ObservableObject {
    @Published var name = ""
    var email = ""
    
    init() {
        let db = Firestore.firestore()
        let usersRef = db.collection("users")
        if let currentUser = Auth.auth().currentUser {
            let userRef = usersRef.document(currentUser.uid)
            userRef.getDocument { document, error in
                if let document = document, document.exists {
                    if let userData = document.data() {
                        self.name = userData["name"] as! String
                        self.email = userData["email"] as! String
                    }
                } else {
                    print(error!.localizedDescription)
                }
            }
        }
    }
}
