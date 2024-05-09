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
    @State var backgroundGradient =  AngularGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1))]), center: .center, angle: .degrees(70))
    @StateObject var dailyViewModel : DailyReportViewModel
    @State var projects: ProjectModel
    
    var body: some View {
    //    NavigationStack {
            ZStack {
                backgroundGradient
                    .ignoresSafeArea()
         //       ScrollView {
                    LazyVStack(alignment: .leading, spacing: 5) {
                        if let imageUrlString = dailyreports.imageUrlString {
                            KFImage(URL(string: imageUrlString))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 180, height: 180)
                                .shadow(radius: 8)
                                .clipShape(Circle())
                            //                                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10), style: .continuous))
                                .padding(.vertical, 10)
                                .padding(.horizontal, 100)
                        } else {
                            Image(systemName: "questionmark.square.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 180, height: 180)
                                .shadow(radius: 8)
                                .clipShape(Circle())
                                .padding(.vertical, 10)
                                .padding(.horizontal, 100)
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {
                            LabeledContent {
                                Text(projects.projectName)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Project: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(projects.location)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Location: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(projects.clientName ?? "")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Client: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(dailyreports.reportDate)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Report Date: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(dailyreports.siteActivity)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Site Activity: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(dailyreports.delayEncountered ?? "")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Delays Encountered: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(dailyreports.weatherequipmentdelay ?? "")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Equipment & Weather Delay Encountered: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(dailyreports.conversation ?? "")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Conversations: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                            
                            LabeledContent {
                                Text(dailyreports.materialDelivered ?? "")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .font(.subheadline)
                                
                            } label: {
                                Text("Material Delivered: ")
                                    .fontWeight(.semibold)
                                    .font(.headline)
                            }
                        }
                        .padding()
                        
                    }
                
                    .padding()
                //      }
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


struct DailyReportCard_Preview: PreviewProvider {
    static var previews: some View {
        DailyReportCard(dailyreports: devPreview.mockDaily, dailyViewModel: DailyReportViewModel(projects: devPreview.mockProjects), projects: devPreview.mockProjects)
    //    DailyReportCard(dailyreports: devPreview.mockFetchDaily)
    }
}

        
