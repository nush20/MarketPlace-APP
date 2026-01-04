//
//  SellerCard.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct SellerCard: View {
    let seller: Seller
    let isBestValue: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(seller.name)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                    
                    HStack(spacing: 8) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 12))
                            .foregroundColor(Color(hex: "a8e6cf"))
                        Text("\(seller.rating, specifier: "%.1f")")
                            .font(.system(size: 14))
                            .foregroundColor(Color(hex: "8a8a8a"))
                    }
                }
                
                Spacer()
                
                if isBestValue {
                    Text("Best Value")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color(hex: "a8e6cf"))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color(hex: "a8e6cf").opacity(0.15))
                        .cornerRadius(8)
                }
            }
            
            Divider()
                .background(Color(hex: "3a3a3a"))
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Price")
                        .font(.system(size: 13))
                        .foregroundColor(Color(hex: "6a6a6a"))
                    Text("₹\(formatPrice(seller.price))")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Delivery")
                        .font(.system(size: 13))
                        .foregroundColor(Color(hex: "6a6a6a"))
                    Text("\(seller.deliveryDays) days")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Auth Score")
                        .font(.system(size: 13))
                        .foregroundColor(Color(hex: "6a6a6a"))
                    Text("\(Int(seller.authenticityScore))%")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color(hex: "a8e6cf"))
                }
            }
        }
        .padding()
        .background(Color(hex: "222222"))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isBestValue ? Color(hex: "a8e6cf").opacity(0.3) : Color.clear, lineWidth: 1.5)
        )
    }
}

