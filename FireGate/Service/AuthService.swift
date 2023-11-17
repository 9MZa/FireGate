//
//  AuthService.swift
//  FireGate
//
//  Created by Bandit Silachai on 17/11/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    static let shared = AuthService()
    
    // MARK: - Create User
    public func CreateUser(with userRequest: CreateUser, completion: @escaping (Bool, Error?)-> Void) {
        let email = userRequest.email
        let username = userRequest.username
        let password = userRequest.password
        
        Auth.auth().createUser(withEmail: email, password: password) {result,error in
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let resultUser = result?.user else {
                completion(false, error)
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users")
                .document(resultUser.uid)
                .setData([
                    "username": username,
                    "email": email
                ]) { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    completion(true, nil)
                }
        }
    }
    
    // MARK: - Sign In
    public func signIn(with user: SignInUser, completion: @escaping (Error?)-> Void ) {
        Auth.auth().signIn(withEmail: user.email, password: user.password) { result, error in
            if let error = error {
                completion(error)
                return
            } else {
                completion(nil)
            }
        }
    }
    
    // MARK: - Sign Out
    public func signOut(completion: @escaping (Error?) -> Void ) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let error {
            completion(error)
        }
    }
    
    // MARK: - Get User
    public func getUser(completion: @escaping (User?, Error?) -> Void ) {
        guard let userUID = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userUID)
            .getDocument { snapshot, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                if let snapshot = snapshot,
                   let snapshotData = snapshot.data(),
                   let username = snapshotData["username"] as? String,
                   let email = snapshotData["email"] as? String {
                    let user = User(userUID: userUID, username: username, email: email)
                    completion(user, nil)
                }
            }
    }
    
    // MARK: - Forgot Password
    public func forgotPassword() {
        
    }
}
