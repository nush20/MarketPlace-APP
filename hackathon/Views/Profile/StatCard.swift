//
//  StatCard.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct StatCard: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(value)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color(hex: "a8e6cf"))
            
            Text(title)
                .font(.system(size: 12))
                .foregroundColor(Color(hex: "8a8a8a"))
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(hex: "222222"))
        .cornerRadius(16)
    }
}

