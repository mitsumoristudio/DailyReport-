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
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            
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
                }
            }
        }
        
    }
}

struct DailyReportSetUp_Preview: PreviewProvider {
    static var previews: some View {
        DailyReportSetUp( viewmodel: DailyReportViewModel(projects: devPreview.mockProjects))
    }
}
