//
//  SellerDetailScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct SellerDetailScreen: View {
    let seller: Seller
    @State private var selectedTab = 0
    
    var sellerListings: [Sneaker] {
        Array(Sneaker.sampleSneakers.shuffled().prefix(8))
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                // Seller Header
                VStack(spacing: 16) {
                    Circle()
                        .fill(Color(hex: "2a2a2a"))
                        .frame(width: 80, height: 80)
                        .overlay(
                            Image(systemName: seller.verified ? "checkmark.seal.fill" : "storefront.fill")
                                .foregroundColor(Color(hex: "a8e6cf"))
                                .font(.system(size: 40))
                        )
                    
                    VStack(spacing: 8) {
                        HStack(spacing: 6) {
                            Text(seller.name)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                            
                            if seller.verified {
                                Image(systemName: "checkmark.seal.fill")
                                    .font(.system(size: 18))
                                    .foregroundColor(Color(hex: "a8e6cf"))
                            }
                        }
                        
                        HStack(spacing: 8) {
                            HStack(spacing: 4) {
                                Image(systemName: "star.fill")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(hex: "a8e6cf"))
                                Text("\(seller.rating, specifier: "%.1f")")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                            }
                            
                            Text("•")
                                .foregroundColor(Color(hex: "4a4a4a"))
                            
                            Text("\(formatSales(seller.totalSales)) sales")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "8a8a8a"))
                            
                            Text("•")
                                .foregroundColor(Color(hex: "4a4a4a"))
                            
                            Text("Joined \(seller.joinedDate)")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "8a8a8a"))
                        }
                    }
                }
                .padding(.top, 20)
                .padding(.bottom, 24)
                
                // Stats Cards
                HStack(spacing: 12) {
                    StatBox(title: "Auth Score", value: "\(Int(seller.authenticityScore))%", icon: "shield.fill")
                    StatBox(title: "Response", value: "\(seller.responseRate)%", icon: "message.fill")
                    StatBox(title: "Delivery", value: "\(seller.deliveryDays) days", icon: "truck.box.fill")
                }
                .padding(.horizontal)
                .padding(.bottom, 24)
                
                // Description
                VStack(alignment: .leading, spacing: 12) {
                    Text("About")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Text(seller.description)
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "8a8a8a"))
                        .lineSpacing(4)
                }
                .padding()
                .background(Color(hex: "222222"))
                .cornerRadius(16)
                .padding(.horizontal)
                .padding(.bottom, 24)
                
                // Seller Listings
                VStack(alignment: .leading, spacing: 16) {
                    Text("Listings")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(sellerListings) { sneaker in
                                NavigationLink(destination: ProductDetailScreen(sneaker: sneaker, selectedTab: .constant(nil))) {
                                    SellerListingCard(sneaker: sneaker)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.bottom, 100)
            }
        }
        .background(Color(hex: "1a1a1a"))
        .navigationTitle(seller.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func formatSales(_ sales: Int) -> String {
        if sales >= 1000 {
            return String(format: "%.1fK", Double(sales) / 1000.0)
        }
        return "\(sales)"
    }
}

