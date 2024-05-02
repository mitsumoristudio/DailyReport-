//
//  AnimationButton.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/2/24.
//

import Foundation
import SwiftUI

struct AnimationButton: View {
    @State private var processing = false
    @State private var completed = false
    @State private var loading: Bool = false
    
    func startButtonAnimation() {
        self.loading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.completed = true
        }
    }
    
    func endButtonAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.processing = true
            self.completed = true
            self.loading = true
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: processing ? 180 : 160, height: 46)
                .foregroundColor(completed ? .red : .indigo)
            
            if !processing {
                AnimationButtonViewModifier().uiSubmitButtonLayout(withText: "Submit")
            }
            
            if processing && !completed {
                HStack {
                    Circle()
                        .trim(from: 0, to: 0.9)
                        .stroke(Color.white, lineWidth: 3)
                        .frame(width: 30, height: 30)
                        .rotationEffect(.degrees(loading ? 360 : 0))
                        .animation(.easeOut
                            .repeatForever(autoreverses: false), value: loading)
                    
                    AnimationButtonViewModifier().uiSubmitButtonLayout(withText: "Processing")
                }
                .transition(.opacity)
                .onAppear {
                    startButtonAnimation()
                }
            }
            if completed {
                AnimationButtonViewModifier().uiSubmitButtonLayout(withText: "Done")
                    .onAppear {
                        endButtonAnimation()
                    }
            }
        }
        .animation(.spring(), value: loading)
        .onTapGesture {
            if !loading {
                self.processing.toggle()
            }
        }
    }
}


struct AnimationButton_Preview : PreviewProvider {
    static var previews: some View {
        AnimationButton()
    }
}

struct AnimationButtonViewModifier: ViewModifier {
    
    func uiSubmitButtonLayout(withText text: String) -> some View {
        Text(text)
            .font(.system(.subheadline, design: .rounded))
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .transition(.move(edge: .top))
    }
    
    
    func body(content: Content) -> some View {
        return content
    }
}

