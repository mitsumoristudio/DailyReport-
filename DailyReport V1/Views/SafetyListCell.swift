//
//  SafetyListCell.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/8/24.
//

import Foundation
import SwiftUI

struct SafetyListCell: View {
    @State var safetyModel : DailySafetyModel
    
    var body: some View {
        VStack( spacing: 10) {
            VStack(alignment: .leading) {
                Text("Report Date: \(safetyModel.reportDate)")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                
                Text("Safety Topic: \(safetyModel.selectedSafetyTopic)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
        }
        .frame(width: 300, height: 80)
        .background(.ultraThickMaterial)
            .cornerRadius(10)
    }
}
