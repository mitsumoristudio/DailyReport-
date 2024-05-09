//
//  SafetyPDF.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/9/24.
//

import Foundation
import SwiftUI
import UIKit


struct SafetyPDF: View {
    @State var generatedImage: Image?
    @State var generatedPDFURL: URL?
    @State var showShareLink: Bool = false
    @State var dailysafetyModel: DailySafetyModel
    @State var projects : ProjectModel
    
    // MARK: Create PDF File
    @MainActor
    func renderCardView(viewSize: CGSize) {
        let renderer = ImageRenderer(content: SafetyListCard(safeyModel: dailysafetyModel, projects: projects).frame(width: viewSize.width, alignment: .center))
        if let image = renderer.uiImage{
            generatedImage = Image(uiImage: image)
     
        }
        
        let tempURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let renderURL = tempURL.appending(path: "\(UUID().uuidString).pdf")
        
        if let consumer = CGDataConsumer(url: renderURL as CFURL), let context = CGContext(consumer: consumer, mediaBox: nil, nil){
            renderer.render { size, renderer in
                var mediaBox = CGRect(origin: .zero, size: size)
                // MARK: Drawing PDF
                context.beginPage(mediaBox: &mediaBox)
                renderer(context)
                context.endPDFPage()
                context.closePDF()
                // MARK: Updating PDF URL
                generatedPDFURL = renderURL
            }
        }
    }
    
    var body: some View {
        
        GeometryReader { proxy in
            let size = proxy.size
            
            NavigationStack {
                ZStack(alignment: .top) {
                    ViewThatFits {
                        SafetyListCard(safeyModel: dailysafetyModel, projects: projects)
                        
                        ScrollView(.vertical) {
                            SafetyListCard(safeyModel: dailysafetyModel, projects: projects)
                        }
                    }
                }
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    renderCardView(viewSize: size)
                }
            }
            
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showShareLink.toggle()
                    } label: {
                        Image(systemName: "square.and.arrow.up.circle.fill")
                            .foregroundColor(Color.black).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 24))
                    }
                }
            }
        }
        .sheet(isPresented: $showShareLink, content: {
            if let generatedPDFURL {
                ShareSheet(items: [generatedPDFURL])
            }
        })
    }
}
