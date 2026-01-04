//
//  SearchResultCard.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct SearchResultCard: View {
    let sneaker: Sneaker
    
    var body: some View {
        HStack(spacing: 16) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(hex: "2a2a2a"))
                .frame(width: 100, height: 100)
                .clipped()
                .overlay(
                    AsyncImage(url: URL(string: sneaker.imageUrl)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .tint(Color(hex: "a8e6cf"))
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .clipped()
                        case .failure:
                            Image(systemName: "photo")
                                .font(.system(size: 30))
                                .foregroundColor(Color(hex: "4a4a4a"))
                        @unknown default:
                            EmptyView()
                        }
                    }
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(sneaker.brand)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Color(hex: "8a8a8a"))
                
                Text(sneaker.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .lineLimit(2)
                
                HStack {
                    Text("₹\(formatPrice(sneaker.price))")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color(hex: "a8e6cf"))
                    
                    if sneaker.verified {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 14))
                            .foregroundColor(Color(hex: "a8e6cf"))
                    }
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14))
                .foregroundColor(Color(hex: "4a4a4a"))
        }
        .padding()
        .background(Color(hex: "222222"))
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

