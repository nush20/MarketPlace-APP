//
//  SellerListingCard.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct SellerListingCard: View {
    let sneaker: Sneaker
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(hex: "2a2a2a"))
                    .frame(width: 160, height: 160)
                    .clipped()
                
                AsyncImage(url: URL(string: sneaker.imageUrl)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .tint(Color(hex: "a8e6cf"))
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 160, height: 160)
                            .clipped()
                    case .failure:
                        Image(systemName: "photo")
                            .font(.system(size: 40))
                            .foregroundColor(Color(hex: "4a4a4a"))
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            
            Text(sneaker.name)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.white)
                .lineLimit(2)
            
            Text("₹\(formatPrice(sneaker.price))")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(Color(hex: "a8e6cf"))
        }
        .frame(width: 160)
    }
}

