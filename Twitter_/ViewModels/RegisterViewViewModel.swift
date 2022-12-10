//
//  RegisterViewViewModel.swift
//  Twitter_
//
//  Created by Abdulmajit Kubatbekov on 09.12.22.
//

import Foundation
import Firebase
import Combine

final class RegisterViewViewModel: ObservableObject {
    
    @Published var email: String?
    @Published var password: String?
    @Published var isRegisterationFormValid: Bool = false
    @Published var user: User?
    
    
    private var subcriptions: Set<AnyCancellable> = []
    
    
    
    func validateRegistrationForm() {
        guard let email = email,
              let password = password else{
            isRegisterationFormValid = false
            return
        }
        isRegisterationFormValid = isValidEmail(email) && password.count >= 8
    }
    
    func isValidEmail(_ email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func createUser() {
        guard let email = email,
              let password = password else{return}
        AuthManager.shared.registerUser(with: email, password: password)
            .sink { _ in
                
            }receiveValue: { [weak self] user in
                self?.user = user
            }
            .store(in: &subcriptions)
    }
}
