//
//  PotentialHazardModel.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/7/24.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct PotentialHazardModel: Identifiable, Codable, Hashable {
    @DocumentID var id: String?
    var potentialHazards: String
    var safetyTopic: String = ""
    var isChecked: Bool = false
}

var hazardCollections: [PotentialHazardModel] = [PotentialHazardModel(potentialHazards: "Body Position"), PotentialHazardModel(potentialHazards: "Grinding"), PotentialHazardModel(potentialHazards: "Materials Handling"), PotentialHazardModel(potentialHazards: "Sharp Edges/Impalement"), PotentialHazardModel(potentialHazards: "Boom Swing"), PotentialHazardModel(potentialHazards: "Grout Burn"), PotentialHazardModel(potentialHazards: "Silica/Asbestos"),
    PotentialHazardModel(potentialHazards: "Chemical Exposure"), PotentialHazardModel(potentialHazards: "Noise"), PotentialHazardModel(potentialHazards: "Slip/Trip Hazards"), PotentialHazardModel(potentialHazards: "Confined Space"), PotentialHazardModel(potentialHazards: "Underground Utilities"), PotentialHazardModel(potentialHazards: "Congested Area"),
    PotentialHazardModel(potentialHazards: "Heat/Cold Stress"),
    PotentialHazardModel(potentialHazards: "Crane Radius/ Boom Swing"), PotentialHazardModel(potentialHazards: "Heavy Equipment/Tracking Equipment"), PotentialHazardModel(potentialHazards: "Pinch Points"),
PotentialHazardModel(potentialHazards: "Suspended Loads"),
PotentialHazardModel(potentialHazards: "Electrical(General & Overhead)"), PotentialHazardModel(potentialHazards: "Hot Work"),
PotentialHazardModel(potentialHazards: "Pressurized Lines"),
PotentialHazardModel(potentialHazards: "Vehicle Safety/ Traffic"),
PotentialHazardModel(potentialHazards: "Increment Weather"),
PotentialHazardModel(potentialHazards: "Vibration"),
PotentialHazardModel(potentialHazards: "Loading & Unloading Equipment"),
PotentialHazardModel(potentialHazards: "Rigging"),
PotentialHazardModel(potentialHazards: "Lifting Heavy Objects"),
PotentialHazardModel(potentialHazards: "Rotating Equipment"),
PotentialHazardModel(potentialHazards: "Excavation")]
