//
//  DailyReportSetUp.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/6/24.
//

import Foundation
import SwiftUI

struct DailyReportSetUp: View {
    @State var showImagePicker: Bool = false
    @State private var selectImage: UIImage?
    @Environment(\.dismiss) var dismiss
    @State private var isAnimating: Bool = false
    @StateObject var viewmodel: DailyReportViewModel
    @State var showAlertIcon: Bool = false
    
    @State var dateSelected: Date = Date.now
    @State var siteActivity: String = ""
    @State var materialDelivered: String = ""
    @State var delayEncountered: String = ""
    @State var equipmentWeatherDelayEncountered: String = ""
    @State var conversation: String = ""
    
    @State var backgroundGradient =  RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1006665184, green: 0.007843137719, blue: 0.7041791803, alpha: 1)).opacity(0.8),Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).opacity(0.9), Color(#colorLiteral(red: 0.07443883983, green: 0.007843137719, blue: 0.4499540527, alpha: 1)).opacity(0.9)]), center: .bottomTrailing, startRadius: 4, endRadius: 400)
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundGradient
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Daily Site Report")
                            .foregroundStyle(Color.white)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top)
                            .padding(.horizontal, 35)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            HStack(spacing: 10) {
                                DatePicker("Select a Date", selection: $dateSelected, displayedComponents: .date)
                                    .padding(.horizontal, 35)
                                    .foregroundColor(Color.blue)
                            }
                            .padding(.leading, 1)
                            .font(.headline)
                            
                            VStack(spacing: 8) {
                                Text("Site Activity")
                                    .modifier(fontModifier())
                                
                                HStack(spacing: 5) {
                                    TextEditor(text: $siteActivity)
                                        .modifier(TextFieldClearButton(nextText: $siteActivity))
                                        .modifier(ChangeSmallerFrameSize())
                                }
                                
                                Text("GC Delay Encountered")
                                    .modifier(fontModifier())
                                
                                HStack(spacing: 5) {
                                    TextEditor(text: $delayEncountered)
                                        .modifier(TextFieldClearButton(nextText: $delayEncountered))
                                        .modifier(ChangeSmallerFrameSize())
                                }
                                
                                Text("Weather & Equipment Delay Encountered")
                                    .modifier(fontModifier())
                                    .lineLimit(2)
                                
                                HStack(spacing: 5) {
                                    TextEditor(text: $equipmentWeatherDelayEncountered)
                                        .modifier(TextFieldClearButton(nextText: $equipmentWeatherDelayEncountered))
                                        .modifier(ChangeSmallerFrameSize())
                                }
                                
                                Text("Site Conversation")
                                    .modifier(fontModifier())
                                
                                HStack(spacing: 5) {
                                    TextEditor(text: $conversation)
                                        .modifier(TextFieldClearButton(nextText: $conversation))
                                        .modifier(ChangeSmallerFrameSize())
                                }
                                
                                Text("Material Delivered")
                                    .modifier(fontModifier())
                                
                                HStack(spacing: 5) {
                                    TextEditor(text: $materialDelivered)
                                        .modifier(TextFieldClearButton(nextText: $materialDelivered))
                                        .modifier(ChangeSmallerFrameSize())
                                }
                                .padding(.bottom, 15)
                                
                                VStack(alignment: .trailing, spacing: 5) {
                                    Button { self.showImagePicker = true
                                        //   print("Show Image Picker")
                                    } label: {
                                        HStack(spacing: 0) {
                                            GradientIconButton(icon: "camera.fill")
                                                .padding(.horizontal, 15)
                                            
                                            Text("Insert Photos")
                                                .foregroundColor(Color.white)
                                                .font(.headline)
                                                .frame(width: 210, height: 60)
                                            
                                            Image(uiImage: selectImage ?? UIImage())
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50, height: 50, alignment: .center)
                                                .clipShape(RoundedRectangle(cornerRadius: 11))
                                                .padding(.horizontal, 10)
                                            
                                        }
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.white.opacity(0.6), lineWidth: 1))
                                        
                                    }
                                    // MARK: Add button here
                                    HStack(spacing: 5) {
                                        Button(action: {
                                            viewmodel.createDailyReport(reportDate: dateSelected, siteActivity: siteActivity, materialDelivered: materialDelivered, delaysEncountered: delayEncountered, image: selectImage, conversation: conversation, weatherequipmentdelay: equipmentWeatherDelayEncountered)
                                            
                                            showAlertIcon = true
                                            
                                            dismiss()
                                        }, label: {
                                            dailyReportButtonUI(withPlaceholder: "Submit", colorName: Color.black)
                                        })
                                        .padding()
                                        
                                        
                                        Button(action: {
                                            
                                            dismiss()
                                        }, label: {
                                            dailyReportButtonUI(withPlaceholder: "Cancel", colorName: Color.indigo)
                                        })
                                    }
                                }
                                .alert("Notification", isPresented: $showAlertIcon, actions: { Text("Daily Report is Now Saved")
                                })
                            }
                        }
                    }
                    .sheet(isPresented: $showImagePicker, content: {
                        ImagePicker(image: $selectImage)
                    })
                    .navigationBarBackButtonHidden(true)
                }
            }
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading, content: {
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
}

struct DailyReportSetUp_Preview: PreviewProvider {
    static var previews: some View {
        DailyReportSetUp( viewmodel: DailyReportViewModel(projects: devPreview.mockProjects))
    }
}


extension DailyReportSetUp {
    func dailyReportButtonUI(withPlaceholder placeholder: String, colorName: Color) -> some View {
        VStack() {
            Text(placeholder)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
                .frame(width: 160, height: 46)
                .background(colorName)
                .cornerRadius(12)
                .padding(.vertical, 5)
        }
    }
}
