//
//  SneakerService.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import Foundation

class SneakerService {
    static let shared = SneakerService()
    
    private init() {}
    
    func getAllSneakers() -> [Sneaker] {
        return Sneaker.sampleSneakers
    }
    
    func getTrendingSneakers() -> [Sneaker] {
        return Array(Sneaker.sampleSneakers.prefix(6))
    }
    
    func getAllSellers() -> [Seller] {
        return Seller.trustedSellers
    }
    
    func getSampleOrders() -> [Order] {
        return [
            Order(id: UUID(), sneaker: Sneaker.sampleSneakers[0], seller: "KicksFederation", status: "In Transit", orderDate: "Jan 2, 2026", trackingNumber: "TRK123456"),
            Order(id: UUID(), sneaker: Sneaker.sampleSneakers[1], seller: "Elite Sneaker Vault", status: "Authenticating", orderDate: "Jan 1, 2026", trackingNumber: "TRK123457"),
            Order(id: UUID(), sneaker: Sneaker.sampleSneakers[2], seller: "Premium Kicks Co", status: "Delivered", orderDate: "Dec 28, 2025", trackingNumber: "TRK123458")
        ]
    }
    
    func getSamplePaymentMethods() -> [PaymentMethod] {
        return [
            PaymentMethod(last4: "4242", type: "Visa", expiry: "12/25"),
            PaymentMethod(last4: "8888", type: "Mastercard", expiry: "06/26")
        ]
    }
    
    func getSampleAddresses() -> [ShippingAddress] {
        return [
            ShippingAddress(name: "Anushka", phone: "+91 9876543210", address: "123 Main Street, Apartment 4B", city: "Mumbai", state: "Maharashtra", pincode: "400001"),
            ShippingAddress(name: "Anushka", phone: "+91 9876543210", address: "456 Park Avenue", city: "Delhi", state: "Delhi", pincode: "110001")
        ]
    }
    
    func getOrderCategoryForStatus(_ status: String) -> String {
        switch status {
        case "In Transit", "Authenticating":
            return "Active"
        case "Delivered":
            return "Completed"
        case "Cancelled":
            return "Cancelled"
        default:
            return "Active"
        }
    }
}



