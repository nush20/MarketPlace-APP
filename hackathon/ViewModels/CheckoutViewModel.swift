//
//  CheckoutViewModel.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import Foundation
import SwiftUI
import Combine

class CheckoutViewModel: ObservableObject {
    @Published var selectedPaymentMethod: PaymentMethod? = nil
    @Published var selectedAddress: ShippingAddress? = nil
    @Published var showAddPayment = false
    @Published var showAddAddress = false
    @Published var showOrderConfirmation = false
    
    private let service = SneakerService.shared
    
    let sneaker: Sneaker
    let seller: Seller
    
    // Store arrays as properties to maintain consistent IDs
    let paymentMethods: [PaymentMethod]
    let addresses: [ShippingAddress]
    
    var canPlaceOrder: Bool {
        selectedPaymentMethod != nil && selectedAddress != nil
    }
    
    init(sneaker: Sneaker, seller: Seller) {
        self.sneaker = sneaker
        self.seller = seller
        
        // Initialize arrays once to maintain consistent IDs
        self.paymentMethods = service.getSamplePaymentMethods()
        self.addresses = service.getSampleAddresses()
        
        // No auto-selection - user must select manually
    }
    
    func placeOrder() -> Order {
        let order = Order(
            id: UUID(),
            sneaker: sneaker,
            seller: seller.name,
            status: "Authenticating",
            orderDate: formatOrderDate(),
            trackingNumber: generateTrackingNumber()
        )
        showOrderConfirmation = true
        return order
    }
    
    private func formatOrderDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: Date())
    }
    
    private func generateTrackingNumber() -> String {
        return "TRK\(Int.random(in: 100000...999999))"
    }
}

