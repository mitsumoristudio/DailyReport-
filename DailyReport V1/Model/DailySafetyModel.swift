//
//  DailySafetyModel.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/8/24.
//

import Foundation
import Firebase
import SwiftUI
import FirebaseFirestoreSwift

struct DailySafetyModel: Identifiable, Codable {
    @DocumentID var id: String?
    
    var selectedSafetyTopic: String
    var reportDate: String
    var bodyPosition: String
    var boomSwing: String
    var chemicalExposure: String
    var confinedSpace: String
    var congestedArea: String
    var craneRadius: String
    var electrical: String
    var excavation: String
    var grinding: String
    var groutBurn: String
    var heatColdStress: String
    var heavyEquipment: String
    var hotWork: String
    var noise: String
    var pinchPoint: String
    var pressurizedLine: String
    var rigging: String
    var rotatatingEquipment: String
    var sharpEdgies: String
    var silica: String
    var suspendedLoads: String
    var slips: String
    var undergroundUtilities: String
    var vehicleSafety : String
    var vibration: String 
    var ownerUid: String?
    
}
