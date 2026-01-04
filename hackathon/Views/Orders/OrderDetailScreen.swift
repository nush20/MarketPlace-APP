//
//  OrderDetailScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct OrderDetailScreen: View {
    let order: Order
    
    var body: some View {
        ZStack {
            Color(hex: "1a1a1a")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    // Order Image
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(hex: "2a2a2a"))
                        .frame(height: 300)
                        .clipped()
                        .overlay(
                            AsyncImage(url: URL(string: order.sneaker.imageUrl)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .tint(Color(hex: "a8e6cf"))
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: UIScreen.main.bounds.width - 40, height: 300)
                                        .clipped()
                                case .failure:
                                    Image(systemName: "photo")
                                        .font(.system(size: 80))
                                        .foregroundColor(Color(hex: "4a4a4a"))
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        )
                        .padding()
                    
                    // Order Info
                    VStack(alignment: .leading, spacing: 16) {
                        Text(order.sneaker.name)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text("Seller: \(order.seller)")
                            .font(.system(size: 16))
                            .foregroundColor(Color(hex: "8a8a8a"))
                        
                        Divider()
                            .background(Color(hex: "3a3a3a"))
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Order Date")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(hex: "6a6a6a"))
                                Text(order.orderDate)
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Status")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(hex: "6a6a6a"))
                                Text(order.status)
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(Color(hex: "a8e6cf"))
                            }
                        }
                        
                        Divider()
                            .background(Color(hex: "3a3a3a"))
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Tracking Number")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(hex: "6a6a6a"))
                                Text(order.trackingNumber)
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(Color(hex: "a8e6cf"))
                            }
                            
                            Spacer()
                        }
                        
                        Divider()
                            .background(Color(hex: "3a3a3a"))
                        
                        HStack {
                            Text("Total")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text("₹\(formatPrice(order.sneaker.price))")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(Color(hex: "a8e6cf"))
                        }
                    }
                    .padding()
                    .background(Color(hex: "222222"))
                    .cornerRadius(16)
                    .padding(.horizontal)
                    
                    // Tracking View
                    TrackingView()
                        .padding(.horizontal)
                }
                .padding(.bottom, 30)
            }
        }
        .navigationTitle("Order Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

