//
//  ProjectDetailCell.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/6/24.
//

import Foundation
import SwiftUI
import Kingfisher

struct ProjectDetailCell: View {
    @State var projects: ProjectModel
    @Environment(\.dismiss) var dismiss
    @State var showSummary: Bool = false
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 5) {
                    if let imageUrlString = projects.imageUrlString {
                        KFImage(URL(string: imageUrlString))
                            .resizing(referenceSize: CGSize(width: 400.00, height: 330.00))
                            .aspectRatio(contentMode: .fill)
                            .shadow(radius: 5)
                            
                    } else {
                        Image(systemName: "questionmark.square.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 400, height: 330)
                            .shadow(radius: 5)
                    }
                    
                    VStack() {
                        projectheadlines(headline: projects)
                    
                    }
                    .padding()
                    
                    Group {
                        VStack(alignment: .leading, spacing: 5) {
                            
                            NavigationLink(destination: {
                                // MARK: Add create Daily Report
                                DailyReportSetUp(viewmodel: DailyReportViewModel(projects: projects), siteActivity: "Testing Sheet", materialDelivered: "27 cyds Cement", delayEncountered: "No delays encountered", equipmentWeatherDelayEncountered: "None", conversation: "Conversation with GC")
                            }, label: {
                                ProjectMenuRow(title: "Create Daily Report", leftIcon: "rectangle.inset.filled.and.person.filled")
                            })
                            .padding(.horizontal, 20)
                        }
                    }
                    
                }
                
                .sheet(isPresented: $showSummary, content: {
                    DailyReportView().environmentObject(DailyReportViewModel(projects: projects))
                })
//                .fullScreenCover(isPresented: $showSummary, content: {
//                    DailyReportView().environmentObject(DailyReportViewModel(projects: projects))
                
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .foregroundColor(Color.black).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 28))
                    })
                })
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showSummary.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color.black).opacity(1)
                            .font(.system(size: 28, design: .rounded))
                    })
                }
                
            }
            .ignoresSafeArea(.all, edges: .top)
        }
        
    }
}

extension ProjectDetailCell {
    func projectheadlines(headline: ProjectModel) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(headline.projectName)
                .font(.system(.title2, design: .rounded))
                .fontWeight(.black)
            
            Text("Project Number: \(headline.projectNumber)")
                .font(.headline)
                .fontWeight(.black)
            
            Text("Location: \(headline.location)")
                .font(.subheadline)
                .fontWeight(.black)
                .padding(.bottom, 10)
            
            Text("Project Manager: \(headline.projectManager)")
                .font(.subheadline)
                .fontWeight(.medium)
            
            Text("Superintendent: \(headline.superintendent)")
                .font(.subheadline)
                .fontWeight(.medium)
           
            Text("Client: \(headline.clientName ?? "")")
                .font(.subheadline)
                .fontWeight(.medium)
            
            Text("Project Description: \(headline.projectDescription)")
                .font(.subheadline)
                .fontWeight(.semibold)
                .lineLimit(4)
        }
        
    }
}
