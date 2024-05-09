//
//  ContentView.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/2/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_Status") var log_Status: Bool = true
    @StateObject var viewModel = ContentViewModel()
    
    
    var body: some View {
//        Group {
//            if viewModel.userSession != nil {
//                MainTabView()
//            } else {
//                LoginView().environmentObject(ContentViewModel())
//            }
//        }
        
        Group {
            if viewModel.userSession != nil {
                MainTabView()
            } else if log_Status {
                MainTabView()
            } else {
                LoginView().environmentObject(ContentViewModel())
            }
        }
    }
}

#Preview {
    ContentView()
}
