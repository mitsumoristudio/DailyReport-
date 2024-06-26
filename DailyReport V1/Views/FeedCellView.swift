//
//  FeedCellView.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/6/24.
//

import Foundation
import SwiftUI
import Kingfisher

struct FeedCellView: View {
    @State var projects: ProjectModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if let profileImageUrl = projects.imageUrlString {
                KFImage(URL(string: profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .padding(.vertical, 10)
                    .frame(width: 400, height: 320)
                    .cornerRadius(5)
                    .shadow(radius: 5)
                
            } else {
                
                Image("DailyReportLogo")
                    .resizable()
                    .scaledToFill()
                    .padding(.vertical, 10)
                    .frame(width: 400, height: 320)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(projects.projectName)
                    .font(.title3)
                    .fontWeight(.black)
                    .lineLimit(2)
                    .padding(.bottom, 0)
                
                Text(projects.location)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .padding(.bottom, 0)
            }
            .padding(.horizontal, 10)
            
            HStack(spacing: 5) {
                NavigationLink(destination: {
                    // MARK: Add summary for Safety Report Here
                    InspectionListView( projects: projects).environmentObject(PotentialHazardViewModel(projects: projects))
                    
                }, label: {
                    ProjectMenuRow(title: "Safety Summary", leftIcon: "cross.fill")
                })
                
                NavigationLink(destination: {
                    // MARK: Add create Safety Report Here
                    SafetyListView(viewModel: PotentialHazardViewModel(projects: projects))
              //      PotentialHazardView()
                }, label: {
                    ProjectMenuRow(title: "Create Safety Report", leftIcon: "cross.case.fill")
                })
            }
            .padding(.horizontal, 20)
        }
    }
}

struct FeedCellView_Preview: PreviewProvider {
    static var previews: some View {
        FeedCellView(projects: devPreview.mockProjects)
    }
}
