//
//  ContentViewModel.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/2/24.
//

import Foundation
import Combine
import Firebase

@MainActor
final class ContentViewModel : ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()// used for signing out user
    
    init() {
        setupSubcribers()
    }
    

     func setupSubcribers() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession // to avoid retaining cycle weak self
        }.store(in: &cancellables)
        
    }
}


