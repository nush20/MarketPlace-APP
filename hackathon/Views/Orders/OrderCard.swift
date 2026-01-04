//
//  OrderCard.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct OrderCard: View {
    let order: Order
    
    var statusColor: Color {
        switch order.status {
        case "Delivered":
            return Color(hex: "a8e6cf")
        case "In Transit":
            return Color(hex: "a8e6cf")
        case "Authenticating":
            return Color(hex: "ffd93d")
        default:
            return Color(hex: "6a6a6a")
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(order.sneaker.name)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Text(order.seller)
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "8a8a8a"))
                }
                
                Spacer()
                
                Text(order.status)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(statusColor)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(statusColor.opacity(0.15))
                    .cornerRadius(8)
            }
            
            Divider()
                .background(Color(hex: "3a3a3a"))
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Order Date")
                        .font(.system(size: 12))
                        .foregroundColor(Color(hex: "6a6a6a"))
                    Text(order.orderDate)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Tracking")
                        .font(.system(size: 12))
                        .foregroundColor(Color(hex: "6a6a6a"))
                    Text(order.trackingNumber)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color(hex: "a8e6cf"))
                }
            }
        }
        .padding()
        .background(Color(hex: "222222"))
        .cornerRadius(16)
    }
}

