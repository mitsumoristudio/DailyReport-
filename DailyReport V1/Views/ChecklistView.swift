//
//  ChecklistView.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/8/24.
//

import Foundation
import SwiftUI


struct ChecklistView: View {
    @State var isCompleted: Bool = false
    @Environment(\.dismiss) var dismiss
    @State var dateSelect: Date = Date()
    @State var safetyTopic: SafetyTopicEnum = .NA
    var yesnoArray: Array = ["N/A", "YES", "NO"]
    @State var bodyPosition = "N/A"
    @State var boomSwing = "N/A"
    @State var chemicalExposure = "N/A"
    @State var confinedSpace = "N/A"
    @State var congestedArea = "N/A"
    @State var craneRadius: String = "N/A"
    @State var electrical = "N/A"
    @State var excavation: String = "N/A"
    @State var grinding: String = "N/A"
    @State var groutBurn: String = "N/A"
    @State var heatColdStress: String = "N/A"
    @State var heavyEquipment: String = "N/A"
    
    
    var body: some View {
        VStack() {
            List  {
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 16) {
                        Text("Body Position")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $bodyPosition) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Boom Swing")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $boomSwing) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Chemical Exposure")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $chemicalExposure) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Confined Space")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $confinedSpace) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Congested Area")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $congestedArea) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Crane Radius & Boom Swing")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $craneRadius) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Electrical (General & Overhead)")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $electrical) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Excavation")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $excavation) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Grinding")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $grinding) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Grout Burn")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $groutBurn) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Cold Stress")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $groutBurn) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    
                    HStack(spacing: 16) {
                        Text("Heavy Equipment/Tracking Equipment")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $heavyEquipment) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    
                    
                }
            }
        }
    }
}

struct CheckListView_Preview: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
