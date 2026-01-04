//
//  TrustedSellerCard.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct TrustedSellerCard: View {
    let seller: Seller
    
    var body: some View {
        HStack(spacing: 16) {
            Circle()
                .fill(Color(hex: "2a2a2a"))
                .frame(width: 50, height: 50)
                .overlay(
                    ZStack {
                        if seller.verified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(Color(hex: "a8e6cf"))
                                .font(.system(size: 20))
                        } else {
                            Image(systemName: "storefront.fill")
                                .foregroundColor(Color(hex: "a8e6cf"))
                        }
                    }
                )
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Text(seller.name)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                    
                    if seller.verified {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 12))
                            .foregroundColor(Color(hex: "a8e6cf"))
                    }
                }
                
                HStack(spacing: 12) {
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 12))
                            .foregroundColor(Color(hex: "a8e6cf"))
                        Text("\(seller.rating, specifier: "%.1f")")
                            .font(.system(size: 13))
                            .foregroundColor(Color(hex: "8a8a8a"))
                    }
                    
                    Text("•")
                        .foregroundColor(Color(hex: "4a4a4a"))
                    
                    Text("\(formatSales(seller.totalSales)) sales")
                        .font(.system(size: 13))
                        .foregroundColor(Color(hex: "8a8a8a"))
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14))
                .foregroundColor(Color(hex: "4a4a4a"))
        }
        .padding(16)
        .background(Color(hex: "222222"))
        .cornerRadius(16)
    }
    
    private func formatSales(_ sales: Int) -> String {
        if sales >= 1000 {
            return String(format: "%.1fK", Double(sales) / 1000.0)
        }
        return "\(sales)"
    }
}

