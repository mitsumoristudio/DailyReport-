//
//  SafetyListView.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/8/24.
//

import Foundation
import SwiftUI

struct SafetyListView: View {
    @State var isCompleted: Bool = false
    @Environment(\.dismiss) var dismiss
    @State var dateSelect: Date = Date()
    @State var safetyTopic: SafetyTopicEnum = .NA
    @StateObject var viewModel: PotentialHazardViewModel
    @State var showAlertIcon: Bool = false
    
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
    @State var coldStress : String = "N/A"
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
 
    private func buttonlabel(withButton placeHolder: String) -> some View {
        Text(placeHolder)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
            .frame(width: 160, height: 46)
            .background(.indigo)
            .cornerRadius(12)
            .padding(.vertical, 5)
    }
    
    func checkboxmainrow(placeholder: PotentialHazardModel) -> some View {
        VStack() {
            HStack(spacing: 5) {
                Text(placeholder.potentialHazards)
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.leading, 5)
                
                Spacer()
                
                Buttonbox()
            }
        }
    }
    
    func TitleView(_ value: String, _ color: Color = .black.opacity(0.9)) -> some View {
        Text(value)
            .font(.system(size: 18))
            .foregroundColor(color)
            .fontWeight(.semibold)
    }
    
    
    var body: some View {
        NavigationStack {
            
                VStack(alignment: .leading, spacing: 5) {
                    VStack(alignment: .leading, spacing: 16) {
                        TitleView("Date")
                           
                        // MARK: Date Picker
                        HStack(alignment: .bottom, spacing: 20) {
                            HStack(spacing: 12) {
                                Text(dateSelect.toString("EEEE dd, MMMM"))
                                    .font(.headline)
                                
                                Image(systemName: "calendar")
                                    .font(.title3)
                                    .foregroundColor(Color.gray)
                                    .overlay {
                                        DatePicker("", selection: $dateSelect, displayedComponents: [.date])
                                            .blendMode(.destinationOver)
                                    }
                            }
                            .offset(y: -5)
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .fill(.black.opacity(0.8))
                                    .frame(height: 1)
                                    .offset(y: 5)
                            }
                        }
                        
                        HStack(spacing: 10) {
                            Text("Select Safety Topic")
                                .lineLimit(1)
                                .foregroundColor(Color.black).opacity(0.8)
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            Picker(selection: $safetyTopic, content: {
                                ForEach(SafetyTopicEnum.allCases.sorted(by: { $0.rawValue < $1.rawValue }), id: \.self) { items in
                                    Text(items.safetyArray)
                                }
                                
                            }, label: {
                                Text("Select Safety Topic")
                            })
                            
                            .pickerStyle(.menu)
                            .foregroundStyle(Color.blue)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Group {
                        // MARK: add checklist View here
                        checklistView()
                    }
                    VStack(alignment: .center, spacing: 5) {
                        HStack(spacing: 5) {
                            Button(action: {
                                // MARK: Add viewmodel to save content
                                viewModel.createSafetyReport(selectedSafetyTopic: safetyTopic.safetyArray, reportDate: dateSelect, bodyPosition: bodyPosition, boomSwing: boomSwing, chemicalExposure: chemicalExposure, confinedSpace: confinedSpace, congestedArea: congestedArea, craneRadius: craneRadius, electrical: electrical, excavation: excavation, grinding: grinding, groutBurn: groutBurn, heatColdStress: heatColdStress, heavyEquipment: heavyEquipment, hotWork: hotWork, noise: noise, pinchPoint: pinchPoint, pressurizedLine: pressurizedLine, rigging: rigging, rotatatingEquipment: rotatatingEquipment, sharpEdges: sharpEdgies, silica: silica, suspendedLoads: suspendedLoads, slips: slips, undergroundUtilities: undergroundUtilities, vehicleSafety: vehicleSafety, vibration: vibration)
                      
                                
                                showAlertIcon = true
                                dismiss()
                                
                                
                            }, label: {
                                buttonlabel(withButton: "Submit")
                            })
                        }
                    }
                    .padding(.horizontal, 120)
                   
                    .alert("Notification", isPresented: $showAlertIcon, actions: {
                        Text("Safety Report Is Now Saved")
                    })
                }
            
            .navigationTitle("Potential Hazards")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing, content: {
                Button(action: {

                    
                    dismiss()
                    
                }, label: {
                    Image(systemName: "chevron.backward.circle")
                        .foregroundColor(Color.white)
                        .background(Color.black, in: Circle())
                        .font(.title)
                })
            })
        }
    }
        
    }

struct SafetyListView_Preview: PreviewProvider {
    static var previews: some View {
        SafetyListView(viewModel: PotentialHazardViewModel(projects: devPreview.mockProjects))
    }
}

extension SafetyListView {
    @ViewBuilder
    func checklistView() -> some View {
        
        List {
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
                    
                    Picker("", selection: $coldStress) {
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
