//
//  OverviewView.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct OverviewView: View {
    let sneaker: Sneaker
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Key Features
            VStack(alignment: .leading, spacing: 12) {
                Text("Key Features")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                
                FeatureRow(icon: "checkmark.seal.fill", text: "100% Authentic Guaranteed", verified: true)
                FeatureRow(icon: "shield.fill", text: "Trust Score: \(Int(sneaker.trustScore))%", verified: true)
                FeatureRow(icon: "truck.box.fill", text: "Free Shipping", verified: true)
                FeatureRow(icon: "return", text: "30-Day Return Policy", verified: true)
            }
            .padding()
            .background(Color(hex: "222222"))
            .cornerRadius(16)
            .padding(.horizontal)
            
            // Description
            VStack(alignment: .leading, spacing: 12) {
                Text("Description")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                
                Text("The \(sneaker.name) is a premium sneaker from \(sneaker.brand), featuring exceptional craftsmanship and design. This verified authentic pair comes with original box and all accessories.")
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: "8a8a8a"))
                    .lineSpacing(4)
            }
            .padding()
            .background(Color(hex: "222222"))
            .cornerRadius(16)
            .padding(.horizontal)
            
            // Specifications
            VStack(alignment: .leading, spacing: 12) {
                Text("Specifications")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                
                SpecRow(label: "Brand", value: sneaker.brand)
                SpecRow(label: "Model", value: sneaker.name)
                SpecRow(label: "Colorway", value: sneaker.colorway)
                SpecRow(label: "Condition", value: "New")
                SpecRow(label: "Authenticity", value: sneaker.verified ? "Verified" : "Pending")
            }
            .padding()
            .background(Color(hex: "222222"))
            .cornerRadius(16)
            .padding(.horizontal)
        }
    }
}

