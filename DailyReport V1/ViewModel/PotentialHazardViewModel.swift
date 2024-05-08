//
//  SafetyView.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/2/24.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestoreSwift

final class PotentialHazardViewModel: ObservableObject {
    @Published var potentialviewModel = [DailySafetyModel]()
    
    var projects: ProjectModel
    
    init(projects: ProjectModel) {
        self.projects = projects
        
        // MARK: Add fetch request here
    }
    
    func createSafetyReport(selectedSafetyTopic: String, reportDate: Date, bodyPosition: String, boomSwing: String, chemicalExposure: String, confinedSpace: String, congestedArea: String, craneRadius: String, electrical: String, excavation: String, grinding: String, groutBurn: String, heatColdStress: String, heavyEquipment: String, hotWork: String, noise: String, pinchPoint: String, pressurizedLine: String, rigging: String, rotatatingEquipment: String, sharpEdges: String, silica: String, suspendedLoads: String, slips: String, undergroundUtilities: String, vehicleSafety : String, vibration: String) {
        
        guard let user = Auth.auth().currentUser else { return }
        guard let projectID = projects.id else { return }
        let document = COLLECTION_PROJECTS.document(projectID).collection("safetyReport").document()
        let documentID = document.documentID
        
        let storedData : [String: Any] = ["selectedSafetyTpoic": selectedSafetyTopic, "reportDate": reportDate, "bodyPosition": bodyPosition, "boomSwing": boomSwing, "checmicalExposure": chemicalExposure, "confinedSpace": confinedSpace, "congestedArea": congestedArea, "craneRadius": craneRadius, "electrical": electrical, "excavation": excavation, "grinding": grinding, "groutBurn" : groutBurn, "heatColdStress": heatColdStress, "heavyEquipment": heavyEquipment, "hotWork": hotWork, "noise": noise, "pinchPoint": pinchPoint, "pressurizedLine": pressurizedLine, "rigging": rigging, "rotatingEquipment": rotatatingEquipment, "sharpEdges": sharpEdges, "silica": silica, "suspendedLoads": suspendedLoads, "slips": slips, "undergroundUtilities": undergroundUtilities, "vehicleSafety": vehicleSafety, "vibration": vibration]
        
        document.setData(storedData)
        
        print("Successfully created Safety Report")
        
    }
    
}
