//
//  OrderViewModel.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import Foundation
import SwiftUI
import Combine

class OrderViewModel: ObservableObject {
    @Published var selectedOrderStatus: String = "All"
    @Published var orders: [Order] = []
    
    private let service = SneakerService.shared
    
    let orderStatuses = ["All", "Active", "Completed", "Cancelled"]
    
    init() {
        loadOrders()
    }
    
    func loadOrders() {
        orders = service.getSampleOrders()
    }
    
    var filteredOrders: [Order] {
        if selectedOrderStatus == "All" {
            return orders
        }
        return orders.filter { order in
            service.getOrderCategoryForStatus(order.status) == selectedOrderStatus
        }
    }
    
    func getCategoryForStatus(_ status: String) -> String {
        return service.getOrderCategoryForStatus(status)
    }
}

