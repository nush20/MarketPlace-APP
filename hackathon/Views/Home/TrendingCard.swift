//
//  TrendingCard.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct TrendingCard: View {
    let sneaker: Sneaker
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(hex: "2a2a2a"))
                
                AsyncImage(url: URL(string: sneaker.imageUrl)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .tint(Color(hex: "a8e6cf"))
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 260, height: 200)
                    case .failure:
                        Image(systemName: "photo")
                            .font(.system(size: 50))
                            .foregroundColor(Color(hex: "4a4a4a"))
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            .frame(width: 260, height: 200)
            .clipped()
            
            VStack(alignment: .leading, spacing: 6) {
                Text(sneaker.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .lineLimit(2)
                
                HStack {
                    Text("₹\(formatPrice(sneaker.price))")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color(hex: "a8e6cf"))
                    
                    Spacer()
                    
                    Circle()
                        .fill(Color(hex: "a8e6cf").opacity(0.2))
                        .frame(width: 30, height: 30)
                        .overlay(
                            Image(systemName: "checkmark.seal.fill")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "a8e6cf"))
                        )
                }
            }
        }
        .frame(width: 260)
        .padding(16)
        .background(Color(hex: "222222"))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.3), radius: 10, y: 5)
    }
}

