//
//  ShareSheet.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/9/24.
//

import Foundation
import SwiftUI
import UIKit

struct ShareSheet: UIViewControllerRepresentable {
    var items: [Any]
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let view = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return view
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}

