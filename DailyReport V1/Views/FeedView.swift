//
//  FeedView.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/6/24.
//

import Foundation
import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = ProjectViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView() {
                LazyVStack(spacing: 30) {
                    ForEach(viewModel.projectViewModel) { projects in
                        NavigationLink {
                            ProjectDetailCell(projects: projects)
                        } label: {
                            FeedCellView(projects: projects)
                        }

                    }
                }
                .padding(.top)
                .navigationTitle("Ongoing Projects")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
}
