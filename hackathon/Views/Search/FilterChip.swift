//
//  FilterChip.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct FilterChip: View {
    let title: String
    let isSelected: Bool
    let showChevron: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Text(title)
                    .font(.system(size: 14, weight: isSelected ? .semibold : .regular))
                    .foregroundColor(isSelected ? Color(hex: "a8e6cf") : Color(hex: "8a8a8a"))
                
                if showChevron {
                    Image(systemName: "chevron.down")
                        .font(.system(size: 10))
                        .foregroundColor(Color(hex: "6a6a6a"))
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(isSelected ? Color(hex: "a8e6cf").opacity(0.15) : Color(hex: "2a2a2a"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(isSelected ? Color(hex: "a8e6cf").opacity(0.5) : Color.clear, lineWidth: 1)
                    )
            )
        }
        .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
}

