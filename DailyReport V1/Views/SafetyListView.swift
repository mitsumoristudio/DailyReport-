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
                        ChecklistView()
                    }
                    VStack(alignment: .center, spacing: 5) {
                        HStack(spacing: 5) {
                            Button(action: {
                                // MARK: Add viewmodel to save content
                                dismiss()
                                
                                
                            }, label: {
                                buttonlabel(withButton: "Submit")
                            })
                        }
                    }
                    .padding(.horizontal, 120)
                    
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
        SafetyListView()
    }
}
