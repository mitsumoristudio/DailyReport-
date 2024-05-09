//
//  OnboardingView.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/9/24.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    @State var offset: CGFloat = 0
    @Environment(\.dismiss) var dismiss
    @State var showMessage: Bool = false
    @Binding var isOnboarding: Bool
    
    var onBoardingScreens: [OnboardingModel] = [OnboardingModel(image: "OnboardingImage2", title: "Daily Site Report", description: "Use to simplify construction reports at ease."), OnboardingModel(image: "OnboardingImage3", title: "Safety Briefing", description: "Manage daily safety bullet points"), OnboardingModel(image: "OnboardingImage1", title: "Safety Checklist", description: "Acessible field reporting ")]
    
    // getting Rotation...
    func getRotations()->Double{
        
        let progress = offset / (getScreensBounds().width * 4)
        
        // Doing one full rotation...
        let rotation = Double(progress) * 360
        
        return rotation
    }
    
    // Changing BG Color based on offset...
    func getIndexes()->Int{
        let progress = (offset / getScreensBounds().width).rounded()
        
        return Int(progress)
    }
    
    func getScreensBounds() -> CGRect {
        return UIScreen.main.bounds
    }
    
    var body: some View {
        
        // Custom Pager View...
        OffsetPageTabView(offset: $offset, content: {
            
            HStack(spacing: 5) {
                ForEach(onBoardingScreens) { screens in
                    
                    VStack(spacing: 16) {
                        
                        Image(screens.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getScreensBounds().width - 100, height: getScreensBounds().width - 100)
                        // small screen Adoption...
                            .scaleEffect(getScreensBounds().height < 750 ? 0.9 : 1)
                            .offset(y: getScreensBounds().height < 750 ? -100 : -120)
                        // MARK: set the curvey rotation for color
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text(screens.title)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.white)
                                .padding(.top, 22)
                            
                            Text(screens.description)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.white)
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .offset(y: -70)
                    }
                    .padding()
                    .frame(width: getScreensBounds().width)
                    .frame(maxHeight: .infinity)
                }
            }
        })
        
        
        
        // MARK: Animation for background
        .background(
            RoundedRectangle(cornerRadius: 50)
                .fill(.white)
            // Size as image size...
                .frame(width: getScreensBounds().width - 120,height: getScreensBounds().width - 100)
                .scaleEffect(2)
                .rotationEffect(.init(degrees: 50))
                .rotationEffect(.init(degrees: getRotations()))
                .offset(y: -getScreensBounds().width + 70)
            
            ,alignment: .leading
        )
        .background(
            Color("color\(getIndexes() + 1)")
                .animation(.easeOut, value: getIndexes())
        )
        .ignoresSafeArea(.container, edges: .all)
        
        // MARK: Conainer - The safe area defined by the device and containers within the user interface, including elements such as top and bottom bars.
        
        // MARK: Button overlay
        .overlay(
            VStack() {
                
                HStack() {
                    
                    Button {
                        
                        showMessage = true
                        dismiss()
                    } label: {
                        Text("Skip")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    
                    // Indicators...
                    HStack(spacing: 8) {
                        ForEach(onBoardingScreens.indices,id: \.self) {index in
                            Circle()
                                .fill(.white)
                                .opacity(index == getIndexes() ? 1 : 0.4)
                                .frame(width: 8, height: 8)
                                .scaleEffect(index == (getIndexes()) ? 1.3 : 0.80)
                                .animation(.easeInOut, value: getIndexes())
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    Button {
                        // Setting Mac Offset...
                        // max 4 screens so max will be 3*width....
                        offset = min(offset + getScreensBounds().width, getScreensBounds().width * 3)
                        
                        showMessage = true
                      //  dismiss()
                       
                    } label: {
                        Text("Next")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    
                }
                .padding(.top, 30)
                .padding(.horizontal, 6)
            }
                .offset(x: 0, y: 340)
                .padding()
        )
        
    }
}


struct OnboardingView_Preview: PreviewProvider {
    static var previews: some View {
        OnboardingView( isOnboarding: .constant(false))
    }
}
