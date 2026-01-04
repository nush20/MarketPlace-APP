//
//  SettingsRow.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct SettingsRow: View {
    let icon: String
    let title: String
    var value: String? = nil
    var showArrow: Bool = true
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 18))
                    .foregroundColor(Color(hex: "a8e6cf"))
                    .frame(width: 30)
                
                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                
                Spacer()
                
                if let value = value {
                    Text(value)
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "8a8a8a"))
                        .padding(.trailing, showArrow ? 8 : 0)
                }
                
                if showArrow {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12))
                        .foregroundColor(Color(hex: "4a4a4a"))
                }
            }
            .padding()
            .background(Color(hex: "222222"))
            .cornerRadius(12)
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}

