//
//  OrderConfirmationScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct OrderConfirmationScreen: View {
    let sneaker: Sneaker
    let seller: Seller
    @Environment(\.dismiss) var dismiss
    @Binding var selectedTab: Int
    
    init(sneaker: Sneaker, seller: Seller, selectedTab: Binding<Int>? = nil) {
        self.sneaker = sneaker
        self.seller = seller
        self._selectedTab = selectedTab ?? .constant(2)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "1a1a1a")
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Spacer()
                    
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(Color(hex: "a8e6cf"))
                    
                    Text("Order Placed!")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Your order has been confirmed")
                        .font(.system(size: 16))
                        .foregroundColor(Color(hex: "8a8a8a"))
                    
                    VStack(spacing: 16) {
                        Text(sneaker.name)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Text("Seller: \(seller.name)")
                            .font(.system(size: 14))
                            .foregroundColor(Color(hex: "8a8a8a"))
                        
                        Text("₹\(formatPrice(seller.price))")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color(hex: "a8e6cf"))
                    }
                    .padding()
                    .background(Color(hex: "222222"))
                    .cornerRadius(16)
                    .padding(.horizontal)
                    
                    Button(action: {
                        selectedTab = 2 // Go to Orders tab
                        dismiss()
                    }) {
                        Text("View Orders")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color(hex: "1a1a1a"))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "a8e6cf"))
                            .cornerRadius(16)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Continue Shopping")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "222222"))
                            .cornerRadius(16)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
            .navigationTitle("Order Confirmed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(Color(hex: "a8e6cf"))
                }
            }
        }
    }
}

