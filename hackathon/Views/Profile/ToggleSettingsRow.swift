//
//  ToggleSettingsRow.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct ToggleSettingsRow: View {
    let icon: String
    let title: String
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(Color(hex: "a8e6cf"))
                .frame(width: 30)
            
            Text(title)
                .font(.system(size: 16))
                .foregroundColor(.white)
            
            Spacer()
            
            Toggle("", isOn: $isOn)
                .tint(Color(hex: "a8e6cf"))
        }
        .padding()
        .background(Color(hex: "222222"))
        .cornerRadius(12)
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}

