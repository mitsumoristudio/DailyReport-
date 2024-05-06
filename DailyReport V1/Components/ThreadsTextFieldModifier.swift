//
//  ThreadsTextFieldModifier.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/3/24.
//

import Foundation
import SwiftUI

struct ThreadsTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 25)
    }
}
