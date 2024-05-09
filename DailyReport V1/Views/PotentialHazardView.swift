//
//  PotentialHazardView.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/7/24.
//

import Foundation
import SwiftUI

struct PotentialHazardView: View {
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
                    
                    
                    List {
                        ForEach(hazardCollections.sorted(by: { $0.potentialHazards < $1.potentialHazards }), id: \.self) { items in
                        checkboxmainrow(placeholder: items)}
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

struct PotentialHazardView_Preview: PreviewProvider {
    static var previews: some View {
        PotentialHazardView()
    }
}

struct CheckboxView: View {
    
    @Binding var checked_mark: Bool
    @Binding var trimVal: CGFloat
    @State var showAnimationToggle = false
    
    var animatableData: CGFloat {
        get {trimVal}
        set {trimVal = newValue }
    }
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .trim(from: 0, to: trimVal)
                .stroke(style: StrokeStyle(lineWidth: 2))
                .frame(width: 40, height: 40)
                .foregroundColor(checked_mark ? Color.green : Color.gray.opacity(0.3))
                .shadow(radius: 5)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 1.0), value: showAnimationToggle)
            
            RoundedRectangle(cornerRadius: 10)
                .trim(from: 0, to: 1)
                .fill(checked_mark ? Color.green : Color.gray.opacity(0.2))
                .animation(.spring(response: 0.2, dampingFraction: 0.2), value: showAnimationToggle)
                .frame(width: 50, height: 50)
                .shadow(radius: 5)
            
            if checked_mark {
                Image(systemName: "checkmark")
            }
        }
    }
}

struct Buttonbox: View {
    @State var check_mark = false
    @State var trimVal: CGFloat = 0
    
    
    var body: some View {
        Button {
            if !self.check_mark {
                withAnimation(Animation.easeIn(duration: 0.3)) {
                    self.trimVal = 1
                    self.check_mark.toggle()
                }
            } else {
                withAnimation {
                    self.trimVal = 0
                    self.check_mark.toggle()
                }
            }
        } label: {
            CheckboxView(checked_mark: $check_mark, trimVal: $trimVal)
        }
    }
}

extension Date {
    
    func toString(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}



