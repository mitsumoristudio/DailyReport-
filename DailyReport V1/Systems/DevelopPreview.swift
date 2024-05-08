//
//  DevelopPreview.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/6/24.
//

import Foundation
import SwiftUI
import Firebase


extension PreviewProvider {
    static var devPreview: DevelopPreview {
        return DevelopPreview.shared
    }
}

class DevelopPreview {
    static let shared = DevelopPreview()
    
    let mockUser = UserModel(email: "mai@gmail.com", uid: "Mia Kuraki", username: NSUUID().uuidString)
    
    let mockProjects = ProjectModel(location: "Brassfield & Gorrie", projectManager: "Lanier Hutchingson", projectNumber: "#1229994", projectName: "Project Panda", projectDescription: "5 -level residential building", superintendent: "Matt Simpspm", ownerUid: NSUUID().uuidString, timeStamp: Timestamp())
    
    let mockDaily = DailySiteModel(uid: "uqiieu12", reportDate: "1/18/24", siteActivity: "3 Piles Drilled, 240 Linear ft", materialDelivered: "18 cyds of Cement was delivered SRM ", delayEncountered: "1hr delay from increment weather", weatherequipmentdelay: "1 hour lost from ligthening stand down", ownerUid: "199uu", conversation: "Desperately need coffee")
    
    let mockSafety = InsiteSafetyModel(title: "Slip and Fall", description: "Trip hazzard", controlMeasure: "Steel toe boots", controlMeasure2: "Proper PPE", jobphoto: "N/A")
}
