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

    var body: some View {
        NavigationStack {
            
                VStack(alignment: .leading, spacing: 5) {
                    
                    List {
                        ForEach(hazardCollections, id: \.self) { items in
                        checkboxmainrow(placeholder: items)}
                    }
                }
            
            .navigationTitle("Potential Hazards")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            
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
                withAnimation(Animation.easeIn(duration: 0.8)) {
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


