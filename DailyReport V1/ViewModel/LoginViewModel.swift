//
//  LoginViewModel.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/2/24.
//

import Foundation
import AuthenticationServices
import SwiftUI
import Firebase

final class LoginViewModel: ObservableObject {
    @Environment (\.dismiss) var dismiss
    
    @MainActor
    func loginUser(email: String, password: String) async throws {
        try await AuthService.shared.loginUser(withEmail: email, password: password)
        
    }
    
//    @MainActor
//    func signInwithGoogle() async throws {
//        try await AuthService.shared.signInWithGoogle()
//    //    try await AuthService.shared.signInWithGoogle()
//   
//    }
    
    
}

