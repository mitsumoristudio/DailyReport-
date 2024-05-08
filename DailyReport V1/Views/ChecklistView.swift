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
    @State var hotWork: String = "N/A"
    @State var noise: String = "N/A"
    @State var pinchPoint: String = "N/A"
    @State var pressurizedLine = "N/A"
    @State var rigging = "N/A"
    @State var rotatatingEquipment = "N/A"
    @State var sharpEdgies = "N/A"
    @State var silica = "N/A"
    @State var suspendedLoads = "N/A"
    @State var slips = "N/A"
    @State var undergroundUtilities = "N/A"
    @State var vehicleSafety = "N/A"
    @State var vibration: String = "N/A"
    
    
    var body: some View {
        // MARK: List of all the check items in safety applicable topics
        
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
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Hot Work (welding & torching)")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $hotWork) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Noise")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $noise) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Pinch Point")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $pinchPoint) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Pressurized Line")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $pressurizedLine) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Rigging")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $rigging) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Rotating Equipment")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $rotatatingEquipment) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Shart Edges & Impalement")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $sharpEdgies) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Silica & Asbestos")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $silica) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Slip & Trip Hazards")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $slips) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Suspended Loads")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $suspendedLoads) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Underground Utilities")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $undergroundUtilities) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Vehicle Safety & Traffic")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $vehicleSafety) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 16) {
                        Text("Vibration")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Picker("", selection: $vibration) {
                            ForEach(yesnoArray, id: \.self) { items in
                                Text(items)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
   
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
