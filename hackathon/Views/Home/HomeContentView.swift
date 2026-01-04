//
//  HomeContentView.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct HomeContentView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 30) {
                // Header
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(getGreeting())
                            .font(.system(size: 14, weight: .light))
                            .foregroundColor(Color(hex: "8a8a8a"))
                    }
                    
                    Spacer()
                    
                    Circle()
                        .fill(Color(hex: "2a2a2a"))
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(systemName: "person.fill")
                                .foregroundColor(Color(hex: "a8e6cf"))
                                .font(.system(size: 18))
                        )
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                // Trending Drops
                VStack(alignment: .leading, spacing: 16) {
                    Text("Trending Drops")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(viewModel.trendingSneakers) { sneaker in
                                NavigationLink(destination: ProductDetailScreen(sneaker: sneaker, selectedTab: .constant(nil))) {
                                    TrendingCard(sneaker: sneaker)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                // Most Trusted Sellers
                VStack(alignment: .leading, spacing: 16) {
                    Text("Most Trusted Sellers")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    VStack(spacing: 12) {
                        ForEach(Array(viewModel.trustedSellers.prefix(5))) { seller in
                            NavigationLink(destination: SellerDetailScreen(seller: seller)) {
                                TrustedSellerCard(seller: seller)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer(minLength: 100)
            }
        }
    }
}

