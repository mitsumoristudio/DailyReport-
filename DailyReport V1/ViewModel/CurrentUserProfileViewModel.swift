//
//  CurrentUserProfileView.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/2/24.
//

import Foundation
import SwiftUI
import Combine

final class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: UserModel?
    
    private var cancellabes = Set<AnyCancellable>()
    
    init() {
        setUpSubscribers()
    }
    
    private func setUpSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellabes)
    }
}
