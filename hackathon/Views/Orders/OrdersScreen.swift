//
//  OrdersScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct OrdersScreen: View {
    @StateObject private var viewModel = OrderViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            // Status Filter
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(viewModel.orderStatuses, id: \.self) { status in
                        Button(action: {
                            viewModel.selectedOrderStatus = status
                        }) {
                            Text(status)
                                .font(.system(size: 14, weight: viewModel.selectedOrderStatus == status ? .semibold : .regular))
                                .foregroundColor(viewModel.selectedOrderStatus == status ? Color(hex: "a8e6cf") : Color(hex: "8a8a8a"))
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(viewModel.selectedOrderStatus == status ? Color(hex: "a8e6cf").opacity(0.15) : Color(hex: "2a2a2a"))
                                )
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)
            }
            
            // Orders List
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(viewModel.filteredOrders) { order in
                        NavigationLink(destination: OrderDetailScreen(order: order)) {
                            OrderCard(order: order)
                        }
                    }
                }
                .padding()
                .padding(.bottom, 100)
            }
        }
        .background(Color(hex: "1a1a1a"))
    }
}

