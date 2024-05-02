//
//  RegistrationViewModel.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/2/24.
//

import Foundation
import SwiftUI

final class RegistrationViewModel: ObservableObject {
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        try await AuthService.shared.createNewUser(withEmail: email, password: password, username: username)
        
        print("Created New User")
        
    }
    func resetUserPassword(email: String) async throws {
        try await AuthService.shared.resetUserPassword(withEmail: email)
        
    }
    
}

