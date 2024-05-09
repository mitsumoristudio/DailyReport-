//
//  OnboardingModel.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/9/24.
//

import Foundation
import SwiftUI

struct OnboardingModel: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
}

//var onBoardingScreens: [OnboardingModel] = [OnboardingModel(image: "OnboardingImage2", title: "Daily Site Report", description: "Use to simplify construction reports at ease."), OnboardingModel(image: "OnboardingImage3", title: "Safety Briefing", description: "Manage daily safety bullet points"), OnboardingModel(image: "OnboardingImage1", title: "Safety Checklist", description: "Acessible field reporting ")]
