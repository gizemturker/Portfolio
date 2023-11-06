//
//  LoginPageModel.swift
//  TurkerShopCrush
//
//  Created by Gizem Turker on 6.05.2023.
//

import SwiftUI

class LoginPageModel: ObservableObject {
    
    // Login
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    //Register
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    
    // Log status..
    
    @AppStorage("log_Status") var log_Status: Bool = false
    
    // Login caller method
    
    func Login() {
        // action
        withAnimation {
            log_Status = true
        }
    }
    
    func Register() {
        // action
        withAnimation {
            log_Status = true
        }
    }
  
    func ForgotPassword() {
        
        // action
    }
}


