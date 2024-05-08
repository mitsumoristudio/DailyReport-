//
//  MainTabView.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/2/24.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    @State var selectedTab = 0
    @State private var showCreateTabview: Bool = false
    @State var devpreview = DevelopPreview()
    
    var body: some View {
        VStack() {
            TabView(selection: $selectedTab) {
               FeedView()
                    .environmentObject(ProjectViewModel())
                    .tabItem {
                        VStack() {
                            Image(systemName: "house.fill")
                            Text("Main")
                        }
                    }
                    .tag(0)
                
                ProjectSetup()
                    .tabItem {
                        VStack() {
                            Image(systemName: "plus.circle.fill")
                            Text("Project")
                        }
                    }
                    .tag(1)
                
                InsiteSafetyView(insiteSafety: devpreview.mockSafety)
                    .tabItem {
                        VStack() {
                            Image(systemName: "cross.vial")
                            Text("Safety")
                        }
                    }
                    .tag(2)
                
                UserProfileView()
                    .tabItem {
                        VStack() {
                            Image(systemName: "gearshape.fill")
                            Text("Settings")
                        }
                    }
            }
            .onChange(of: selectedTab) { oldValue, newValue in
                showCreateTabview = selectedTab == 1
            }
            .sheet(isPresented: $showCreateTabview, content: {
                ProjectSetup()
            })
        }
        
    }
}

struct MainTabView_Preview: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
