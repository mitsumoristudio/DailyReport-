//
//  InspectionListView.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/8/24.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct InspectionListView: View {
    @EnvironmentObject var viewmodel: PotentialHazardViewModel
    @Environment(\.dismiss) var dismiss
    @State private var searchText: String = ""
    @State private var updatedTopics = [DailySafetyModel]()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 5) {
                List {
                    ForEach(viewmodel.potentialviewModel, id: \.self) { items in
                        
                        NavigationLink(destination: {
                            SafetyListCard(safeyModel: items)
        
                        }, label: {
                            SafetyListCell(safetyModel: items)
                        })
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                // MARK: set as documentID to deletelist
                               
                            
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                    }
                }
                .onAppear {
                    viewmodel.fetchSafetyReport()
                }
                
            }
            .navigationTitle("Safety List")
            .navigationBarTitleDisplayMode(.inline)
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
}
