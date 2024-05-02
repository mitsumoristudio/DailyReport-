//
//  ProjectModel.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/2/24.
//

import Foundation
import Firebase
import SwiftUI
import FirebaseFirestoreSwift

struct ProjectModel: Identifiable, Codable {
    @DocumentID var id: String?
    var clientName: String?
    var location: String
    var imageUrlString: String?
    var projectManager: String
    var projectNumber: String
    var projectName: String
    var projectDescription: String
    var superintendent: String
    let ownerUid: String
    let timeStamp: Timestamp
    
   
    var user: UserModel?
   
    
}
