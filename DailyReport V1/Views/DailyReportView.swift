//
//  DailyReportView.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/6/24.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct DailyReportView: View {
    @EnvironmentObject var viewmodel: DailyReportViewModel
    @Environment(\.dismiss) var dismiss
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack() {
                List {
                    ForEach(viewmodel.dailyVM, id: \.self) { items in
                     //   Text(items.siteActivity)
                        NavigationLink(destination: {
                            DailyReportCard(dailyreports: items, dailyViewModel: DailyReportViewModel(projects: DevelopPreview.shared.mockProjects))
                        }, label: {
                            DailyReportCell(dailyReport: items)
                        })
                        
                        
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                    // MARK: set as documentID to deletelist
                                    viewmodel.deleteDailyReport(reportID: items.documentID ?? "")
                                
                                } label: {
                                    Image(systemName: "trash")
                                }
                            }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .onAppear {
                viewmodel.fetchDailyReport()
            }
            .navigationBarBackButtonHidden(true)
        }
        
        
        //        NavigationStack {
        //            ScrollView {
        //                LazyVStack(spacing: 0) {
        //                    ForEach(viewmodel.dailyVM, id: \.self) { dailyReports in
        //                        NavigationLink(destination: {
        //                            DailyReportCard(dailyreports: dailyReports, dailyViewModel: DailyReportViewModel(projects: DevelopPreview.shared.mockProjects))
        //                        }, label: {
        //                            DailyReportCell(dailyReport: dailyReports)
        //                        })
        //                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
        //                            Button(action: {
        //                                viewmodel.deleteReport(reports: dailyReports)
        //                            }, label: {
        //                                Text("Delete")
        //                            })
        //                            .tint(.red)
        //                        }
        //                    }
        //
        //                    .padding()
        //
        //                    .navigationTitle("Daily Report")
        //                    .navigationBarTitleDisplayMode(.inline)
        //                    .navigationBarBackButtonHidden(true)
        //
        //
        //                }
        //            }
        //        }
        
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
    
    
    struct DailyReportView_Preview: PreviewProvider {
        static var previews: some View {
            DailyReportView().environmentObject(DailyReportViewModel(projects: devPreview.mockProjects))
        }
    }
}
