//
//  FeatureRow.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct FeatureRow: View {
    let icon: String
    let text: String
    let verified: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 16))
                .foregroundColor(Color(hex: "a8e6cf"))
                .frame(width: 24)
            
            Text(text)
                .font(.system(size: 14))
                .foregroundColor(.white)
            
            Spacer()
        }
    }
}

