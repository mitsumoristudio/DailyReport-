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
        fetchSafetyReport()
    }
    
    func createSafetyReport(selectedSafetyTopic: String, reportDate: Date, bodyPosition: String, boomSwing: String, chemicalExposure: String, confinedSpace: String, congestedArea: String, craneRadius: String, electrical: String, excavation: String, grinding: String, groutBurn: String, heatColdStress: String, heavyEquipment: String, hotWork: String, noise: String, pinchPoint: String, pressurizedLine: String, rigging: String, rotatatingEquipment: String, sharpEdges: String, silica: String, suspendedLoads: String, slips: String, undergroundUtilities: String, vehicleSafety : String, vibration: String) {
        
        guard let user = Auth.auth().currentUser else { return }
        guard let projectID = projects.id else { return }
        let document = COLLECTION_PROJECTS.document(projectID).collection("safetyReport").document()
        let documentID = document.documentID
        
        let storedData : [String: Any] = ["selectedSafetyTopic": selectedSafetyTopic, "reportDate": reportDate, "bodyPosition": bodyPosition, "boomSwing": boomSwing, "chemicalExposure": chemicalExposure, "confinedSpace": confinedSpace, "congestedArea": congestedArea, "craneRadius": craneRadius, "electrical": electrical, "excavation": excavation, "grinding": grinding, "groutBurn" : groutBurn, "heatColdStress": heatColdStress, "heavyEquipment": heavyEquipment, "hotWork": hotWork, "noise": noise, "pinchPoint": pinchPoint, "pressurizedLine": pressurizedLine, "rigging": rigging, "rotatingEquipment": rotatatingEquipment, "sharpEdges": sharpEdges, "silica": silica, "suspendedLoads": suspendedLoads, "slips": slips, "undergroundUtilities": undergroundUtilities, "vehicleSafety": vehicleSafety, "vibration": vibration, "documentID": documentID, "userUID": user.uid]
        
       document.setData(storedData)
        
        print("Successfully created Safety Report")
    }
    
    func fetchSafetyReport() {
        guard let projectID = projects.id else { return }
        
        COLLECTION_PROJECTS.document(projectID).collection("safetyReport").order(by: "reportDate").getDocuments { (querySnapshot, _) in
            
            guard let documents = querySnapshot?.documents else { return }
            self.potentialviewModel = documents.map({ queryDocumentSnapshot -> DailySafetyModel in
                let data = queryDocumentSnapshot.data()
                let dateValue = (data["reportDate"] as AnyObject).dateValue()
                let date = dateValue.formatDate()
                let documentID = data["documentID"] as? String ?? ""
                let selectedSafetyTopic = data["selectedSafetyTopic"] as? String ?? ""
                let bodyPosition = data["bodyPosition"] as? String ?? ""
                let boomSwing = data["boomSwing"] as? String ?? ""
                let chemicalExposure = data["chemicalExposure"] as? String ?? ""
                let confinedSpace = data["confinedSpace"] as? String ?? ""
                let congestedArea = data["congestedArea"] as? String ?? ""
                let craneRadius = data["craneRadius"] as? String ?? ""
                let electrical = data["electrical"] as? String ?? ""
                let excavation = data["excavation"] as? String ?? ""
                let grinding = data["grinding"] as? String ?? ""
                let groutBurn = data["groutBurn"] as? String ?? ""
                let heatColdStress = data["heatColdStress"] as? String ?? ""
                let heavyEquipment = data["heavyEquipment"] as? String ?? ""
                let rotatingEquipment = data["rotatingEquipment"] as? String ?? ""
                let noise = data["noise"] as? String ?? ""
                let pinchPoint = data["pinchPoint"] as? String ?? ""
                let hotWork = data["hotWork"] as? String ?? ""
                let pressurizedLine = data["pressurizedLine"] as? String ?? ""
                let rigging = data["rigging"] as? String ?? ""
                let sharpEdges = data["sharpEdges"] as? String ?? ""
                let silica = data["silica"] as? String ?? ""
                let suspendedLoads = data["suspendedLoads"] as? String ?? ""
                let slips = data["slips"] as? String ?? ""
                let undergroundUtilities = data["undergroundUtilities"] as? String ?? ""
                let vehicleSafety = data["vehicleSafety"] as? String ?? ""
                let vibration = data["vibration"] as? String ?? ""
               
                
                return DailySafetyModel(selectedSafetyTopic: selectedSafetyTopic, reportDate: date, bodyPosition: bodyPosition, boomSwing: boomSwing, chemicalExposure: chemicalExposure, confinedSpace: confinedSpace, congestedArea: congestedArea, craneRadius: craneRadius, electrical: electrical, excavation: excavation, grinding: grinding, groutBurn: groutBurn, heatColdStress: heatColdStress, heavyEquipment: heavyEquipment, hotWork: hotWork, noise: noise , pinchPoint: pinchPoint, pressurizedLine: pressurizedLine, rigging: rigging, rotatatingEquipment: rotatingEquipment, sharpEdgies: sharpEdges, silica: silica, suspendedLoads: suspendedLoads, slips: slips, undergroundUtilities: undergroundUtilities, vehicleSafety: vehicleSafety, vibration: vibration, documentID: documentID)
            })
            
        }
        
    }
    
}


