//
//  SafetyListCard.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/8/24.
//

import Foundation
import SwiftUI

struct SafetyListCard: View {
    @State var safeyModel: DailySafetyModel
    @Environment(\.dismiss) var dismiss
    @State var backgroundGradient =  AngularGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1))]), center: .center, angle: .degrees(70))
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundGradient
                    .ignoresSafeArea()
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 5) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Report Date")
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            Text("\(safeyModel.reportDate)")
                                .font(.subheadline)
                                .fontWeight(.medium)
                        }
                        
                    }
                }
            }
        }
    }
}

