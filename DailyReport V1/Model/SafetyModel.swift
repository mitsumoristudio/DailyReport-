//
//  SafetyModel.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/6/24.
//

import Foundation
import SwiftUI

struct InsiteSafetyModel: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var subtitle: String = "Potential Hazards"
    var description: String
    var hazardControltitle: String = "Hazard Control Measures & Procedures"
    var controlMeasure: String
    var controlMeasure2: String
    var jobphoto: String
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
    
}
    
