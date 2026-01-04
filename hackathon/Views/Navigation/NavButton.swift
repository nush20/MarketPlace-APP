//
//  NavButton.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct NavButton: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(isSelected ? Color(hex: "a8e6cf") : Color(hex: "6a6a6a"))
                
                Text(title)
                    .font(.system(size: 11, weight: isSelected ? .semibold : .regular))
                    .foregroundColor(isSelected ? Color(hex: "a8e6cf") : Color(hex: "6a6a6a"))
            }
        }
    }
}

