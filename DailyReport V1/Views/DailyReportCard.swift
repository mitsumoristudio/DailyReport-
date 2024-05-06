//
//  DailyReportCard.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/6/24.
//

import Foundation
import SwiftUI
import Kingfisher

struct DailyReportCard: View {
    @State var dailyreports: DailySiteModel
    @Environment(\.dismiss) var dismiss
    @State var backgroundGradient =  AngularGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1))]), center: .center, angle: .degrees(70))
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundGradient
                    .ignoresSafeArea()
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 5) {
                        if let imageUrlString = dailyreports.imageUrlString {
                            KFImage(URL(string: imageUrlString))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .shadow(radius: 8)
                                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10), style: .continuous))
                                .padding(.vertical, 10)
                        } else {
                            Image(systemName: "questionmark.square.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .shadow(radius: 8)
                                .padding(.vertical, 10)
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Report Date:")
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            Text("\(dailyreports.reportDate)")
                                .font(.subheadline)
                            
                            Text("Site Activity:")
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            Text("\(dailyreports.siteActivity)")
                                .font(.subheadline)
                            
                            Text("Delays Encountered:")
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            Text(dailyreports.delayEncountered ?? "")
                                .font(.subheadline)
                            
                            Text("Equipment & Weather Delay Encountered:")
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            Text(dailyreports.weatherequipmentdelay ?? "")
                                .font(.subheadline)
                            
                            
                            Text("Conversations:")
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            Text(dailyreports.conversation ?? "")
                                .font(.subheadline)
                            
                            Text("Material Delivered:")
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            Text(dailyreports.materialDelivered ?? "")
                                .font(.subheadline)
                            
                        }
                    }
                    .padding()
                    
                }
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left.circle.fill")
                                .foregroundColor(Color.black).opacity(0.8)
                                .font(.system(size: 25))
                        }
                    }
                }
            }
        }
    }
}


struct DailyReportCard_Preview: PreviewProvider {
    static var previews: some View {
        DailyReportCard(dailyreports: devPreview.mockDaily)
    //    DailyReportCard(dailyreports: devPreview.mockFetchDaily)
    }
}

        
