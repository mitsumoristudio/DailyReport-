//
//  DailyReportCell.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/6/24.
//

import Foundation
import SwiftUI
import Kingfisher

struct DailyReportCell: View {
    @State var dailyReport: DailySiteModel
    
    var body: some View {
        VStack(spacing: 5) {
            VStack(alignment: .leading) {
                HStack(alignment: .top, spacing: 12) {
                    
                    if let imageURLString = dailyReport.imageUrlString {
                        KFImage(URL(string: imageURLString))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    } else {
                        Image(systemName: "questionmark.square.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack(spacing: 5) {
                            Text("Report Date: \(dailyReport.reportDate)")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        Text("Site Activity: \(dailyReport.siteActivity)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
            }
            .frame(width: 300, height: 80)
            .background(.ultraThickMaterial)
                .cornerRadius(10)
            
           //     .padding()
            }
        }
    }


struct DailyReportCell_Preview: PreviewProvider {
    static var previews: some View {
        DailyReportCell(dailyReport: devPreview.mockDaily)
    }
}
