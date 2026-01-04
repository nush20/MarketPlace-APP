//
//  FAQItem.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct FAQItem: View {
    let question: String
    let answer: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(question)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
            
            Text(answer)
                .font(.system(size: 14))
                .foregroundColor(Color(hex: "8a8a8a"))
                .lineSpacing(4)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(hex: "222222"))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

