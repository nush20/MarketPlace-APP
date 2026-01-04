//
//  StatBox.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct StatBox: View {
    let title: String
    let value: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(Color(hex: "a8e6cf"))
            
            Text(value)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            
            Text(title)
                .font(.system(size: 12))
                .foregroundColor(Color(hex: "8a8a8a"))
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(hex: "222222"))
        .cornerRadius(12)
    }
}

