//
//  SizePill.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct SizePill: View {
    let size: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(size)
                .font(.system(size: 15, weight: isSelected ? .semibold : .regular))
                .foregroundColor(isSelected ? Color(hex: "a8e6cf") : .white)
                .frame(width: 60, height: 44)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(isSelected ? Color(hex: "a8e6cf").opacity(0.15) : Color(hex: "2a2a2a"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(isSelected ? Color(hex: "a8e6cf").opacity(0.5) : Color.clear, lineWidth: 1.5)
                        )
                )
        }
    }
}

