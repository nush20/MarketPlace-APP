//
//  ProfileMenuItem.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct ProfileMenuItem: View {
    let icon: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(Color(hex: "a8e6cf"))
                    .frame(width: 30)
                
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: "4a4a4a"))
            }
            .padding()
            .background(Color(hex: "222222"))
            .cornerRadius(12)
        }
    }
}

