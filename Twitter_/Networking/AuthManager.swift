//
//  AuthManager.swift
//  Twitter_
//
//  Created by Abdulmajit Kubatbekov on 10.12.22.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseAuthCombineSwift
import Combine


class AuthManager {
    static let shared = AuthManager()
    
    func registerUser(with email: String, password: String) -> AnyPublisher<User, Error> {
           return Auth.auth().createUser(withEmail: email, password: password)
               .map(\.user)
               .eraseToAnyPublisher()
       }
}

//func registerUser(with Email: String, Password: String) -> AnyPublisher<User, Error> {
//    return Auth.auth().createUser(withEmail: Email, password: Password)
//        .map(\.user)
//        .eraseToAnyPublisher()
//}
