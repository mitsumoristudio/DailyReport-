//
//  UserModel.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/2/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct UserModel: Identifiable, Codable {
    @DocumentID var id: String?
    let email: String
    let uid: String
    let username: String
    var profileImageUrl: String?
}
