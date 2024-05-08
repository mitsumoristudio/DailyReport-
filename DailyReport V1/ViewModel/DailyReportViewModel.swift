//
//  DailyReportViewModel.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/6/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import SwiftUI


final class DailyReportViewModel: ObservableObject {
    @Published var dailyVM = [DailySiteModel]()
    
    
    var projects: ProjectModel
    
    init(projects: ProjectModel) {
        self.projects = projects
        
        fetchDailyReport()
    }
    
    func createDailyReport(reportDate: Date, siteActivity: String, materialDelivered: String, delaysEncountered: String, image: UIImage?, conversation: String, weatherequipmentdelay: String)   {
        guard let user = Auth.auth().currentUser else { return }
        guard let projectID = projects.id else {return}
        guard let image = image else { return }
        let document = COLLECTION_PROJECTS.document(projectID).collection("dailyReport").document()
        let documentID = document.documentID
                  
        ProjectImageUpload.uploadImage(image: image, type: .dailyReport) { imageUrl in
            let storedData : [String: Any] = ["reportDate": reportDate, "siteActivity": siteActivity, "materialDelivered": materialDelivered, "delaysEncountered" : delaysEncountered, "ownerUid": user.uid, "imageUrlString": imageUrl, "conversation": conversation, "weatherequipmentdelay": weatherequipmentdelay, "documentID" : documentID]
            
            document.setData(storedData)
            
           // COLLECTION_PROJECTS.document(projectID).collection("dailyReport").addDocument(data: storedData)
            //  Firestore.firestore().collection("dailyReport").addDocument(data: storedData)
            
            print("Successfully upload Daily Report")
        }
    }
    
    func deleteDailyReport(reportID: String) {
        guard let projectID = projects.id else { return }
        
        COLLECTION_PROJECTS.document(projectID).collection("dailyReport").document(reportID).delete()
        
        print("Deleted document")
        
        fetchDailyReport()
    }
    
    func deleteReport(reports: DailySiteModel) {
        
        guard let projectID = projects.id else { return }
        
        let index = dailyVM.first(where: { currentPost in
            return currentPost.id == reports.id
        })
        
        
        COLLECTION_PROJECTS.document(projectID).collection("dailyReport").document().delete()
        
//        withAnimation {
//            dailyVM.remove(at: index)
//        }
        
    }
    
    
    func fetchDailyReport() {
        guard let projectID = projects.id else { return }
        
        COLLECTION_PROJECTS.document(projectID).collection("dailyReport").order(by: "reportDate").getDocuments { (querySnapshot, _) in
            //  Firestore.firestore().collection("dailyReport").getDocuments { (querySnapshot, _) in
            guard let documents = querySnapshot?.documents else { return }
            self.dailyVM = documents.map({ queryDocumentSnapshot -> DailySiteModel in
                let data = queryDocumentSnapshot.data()
                let dateValue = (data["reportDate"] as AnyObject).dateValue()
                let date = dateValue.formatDate()
                let siteActivity = data["siteActivity"] as? String ?? ""
                let materialDelivered = data["materialDelivered"] as? String ?? ""
                let delaysEncountered = data["delaysEncountered"] as? String ?? ""
                let ownerUid = data["ownerUid"] as? String ?? ""
                let imageUrlString = data["imageUrlString"] as? String ?? ""
                let uid = data["uid"] as? String ?? ""
                let conversation = data["conversation"] as? String ?? ""
                let weatherequipmentdelay = data["weatherequipmentdelay"] as? String ?? ""
                
                return DailySiteModel(uid: uid, reportDate: date, siteActivity: siteActivity, materialDelivered: materialDelivered, delayEncountered: delaysEncountered, weatherequipmentdelay: weatherequipmentdelay, ownerUid: ownerUid, imageUrlString: imageUrlString, conversation: conversation)

            })
        }
    }
}

extension Date {
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy")
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.string(from: self)
    }
}
