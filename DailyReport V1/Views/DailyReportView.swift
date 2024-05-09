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
    @State private var updatedTopics = [DailySiteModel]()
    @State var projects: ProjectModel
    
    var filterReportTopics: [DailySiteModel] {
        guard !searchText.isEmpty else {
            return viewmodel.dailyVM.sorted { $0.reportDate < $1.reportDate }
        }
        return viewmodel.dailyVM.filter { searchreport in
            searchreport.reportDate.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack() {
                List {
                    ForEach(filterReportTopics, id: \.self) { items in
                 //   ForEach(viewmodel.dailyVM, id: \.self) { items in
                     //   Text(items.siteActivity)
                        NavigationLink(destination: {
                            // MARK: Add PDF formatter
                            DailyReportPDF(dailyReport: items, projects: projects, dailyVM: DailyReportViewModel(projects: projects))
                            
                            // MARK: Daily Report Card without PDF formatter
//                            DailyReportCard(dailyreports: items, dailyViewModel: DailyReportViewModel(projects: DevelopPreview.shared.mockProjects), projects: projects)
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
            .searchable(text: $searchText, prompt: "Search Report Info")
            .onChange(of: searchText, { (searchTexts, _) in
                
                updatedTopics = viewmodel.dailyVM.filter({ reports in
                    reports.reportDate.contains(searchTexts)
                })
            })
            
            .onAppear {
                viewmodel.fetchDailyReport()
            }
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
    
    
    struct DailyReportView_Preview: PreviewProvider {
        static var previews: some View {
            DailyReportView( projects: devPreview.mockProjects).environmentObject(DailyReportViewModel(projects: devPreview.mockProjects))
        }
    }
}
