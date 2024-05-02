//
//  DailySiteModel.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/2/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct DailySiteModel: Identifiable, Codable, Hashable {
    @DocumentID var id: String?
    var uid: String
    var reportDate: String
    var siteActivity: String
    var materialDelivered: String?
    var delayEncountered: String?
    var weatherequipmentdelay: String?
    var ownerUid: String
    var imageUrlString: String?
    var conversation: String?
}
