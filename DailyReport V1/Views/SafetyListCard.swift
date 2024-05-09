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
    @State var projects: ProjectModel
    @State var backgroundGradient =  AngularGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1))]), center: .center, angle: .degrees(70))
    
    var body: some View {
    //    NavigationStack {
            ZStack {
                backgroundGradient
                    .ignoresSafeArea()
           //     ScrollView {
                    LazyVStack(alignment: .leading, spacing: 5) {
                        VStack(alignment: .leading, spacing: 12) {
                            
                            LabeledContent {
                                Text(projects.projectName)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Project: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(projects.location)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Location: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(projects.clientName ?? "")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Client: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.reportDate)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Report Date: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.selectedSafetyTopic)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Safety Topic: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            Text("Onsite Safety Evaluation")
                                .font(.title3)
                                .fontWeight(.bold)
                                .underline()
                            
                            LabeledContent {
                                Text(safeyModel.bodyPosition)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Body Position: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.boomSwing)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Boom Swing: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.chemicalExposure)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Chemical Exposure: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.confinedSpace)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Confined Space: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.congestedArea)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Congested Area: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.craneRadius)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Crane Radius & Boom Swing: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.electrical)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Electrical (General & Overhead): ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.excavation)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Excavation: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.grinding)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Grinding: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.groutBurn)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Grout Burn: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.heatColdStress)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Cold Stress: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.heavyEquipment)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Heavy Equipment/ Tracking Equipment: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.hotWork)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Hot Work(welding & torching): ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.noise)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Noise: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.pinchPoint)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Pinch Point: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.pressurizedLine)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Pressurized Line: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.rigging)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Rigging: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.rotatatingEquipment)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Rotating Equipment: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.sharpEdgies)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Sharp Edges & Impalement: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.silica)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Silica & Asbestos: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.slips)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Slips & Trip Hazards ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.suspendedLoads)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Suspended Loads ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.undergroundUtilities)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Underground Utilities ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            
                            LabeledContent {
                                Text(safeyModel.vehicleSafety)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Vehicle Safety & Traffic ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(safeyModel.vibration)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Vibration ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                        }
                        
                    }
                    .padding()
            //    }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .foregroundColor(Color.black).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 25))
                    }
                }
            }
            
         //  .ignoresSafeArea(.all, edges: .top)
        }
   
        }
        
 //   }


