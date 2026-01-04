//
//  HomeViewModel.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var trendingSneakers: [Sneaker] = []
    @Published var trustedSellers: [Seller] = []
    
    private let service = SneakerService.shared
    
    init() {
        loadData()
    }
    
    func loadData() {
        trendingSneakers = service.getTrendingSneakers()
        trustedSellers = service.getAllSellers()
    }
}

