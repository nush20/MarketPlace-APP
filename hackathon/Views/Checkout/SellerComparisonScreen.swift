//
//  SellerComparisonScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct SellerComparisonScreen: View {
    let sneaker: Sneaker
    @Binding var selectedTab: Int
    
    var sellers: [Seller] {
        Array(Seller.trustedSellers.prefix(3))
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(hex: "1a1a1a")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(Array(sellers.enumerated()), id: \.element.id) { index, seller in
                        SellerCard(seller: seller, isBestValue: index == 0)
                    }
                }
                .padding()
                .padding(.bottom, 100)
            }
            
            NavigationLink(destination: CheckoutScreen(sneaker: sneaker, seller: sellers[0], selectedTab: $selectedTab)) {
                Text("Continue with KicksFederation")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color(hex: "1a1a1a"))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex: "a8e6cf"))
                    .cornerRadius(16)
                    .padding(.horizontal)
            }
            .padding(.bottom, 30)
            .background(
                LinearGradient(
                    colors: [Color(hex: "1a1a1a").opacity(0), Color(hex: "1a1a1a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 120)
            )
        }
        .navigationTitle("Compare Sellers")
        .navigationBarTitleDisplayMode(.inline)
    }
}

