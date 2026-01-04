//
//  AuthStepRow.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct AuthStepRow: View {
    let step: AuthStep
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: step.icon)
                .font(.system(size: 20))
                .foregroundColor(step.verified ? Color(hex: "a8e6cf") : Color(hex: "4a4a4a"))
                .frame(width: 40, height: 40)
                .background(
                    Circle()
                        .fill(step.verified ? Color(hex: "a8e6cf").opacity(0.15) : Color(hex: "2a2a2a"))
                )
            
            Text(step.title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(step.verified ? .white : Color(hex: "6a6a6a"))
            
            Spacer()
            
            if step.verified {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 20))
                    .foregroundColor(Color(hex: "a8e6cf"))
            } else {
                Image(systemName: "circle")
                    .font(.system(size: 20))
                    .foregroundColor(Color(hex: "3a3a3a"))
            }
        }
        .padding()
        .background(Color(hex: "222222"))
        .cornerRadius(12)
    }
}

