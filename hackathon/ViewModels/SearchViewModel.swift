//
//  SearchViewModel.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import Foundation
import SwiftUI
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var selectedBrand: String? = nil
    @Published var selectedSize: String? = nil
    @Published var priceRange: PriceRange = .all
    @Published var showingBrandFilter = false
    @Published var showingSizeFilter = false
    @Published var showingPriceFilter = false
    
    private let service = SneakerService.shared
    private let allSneakers: [Sneaker]
    
    init() {
        self.allSneakers = service.getAllSneakers()
    }
    
    var allBrands: [String] {
        Array(Set(allSneakers.map { $0.brand })).sorted()
    }
    
    var allSizes: [String] {
        Array(Set(allSneakers.flatMap { $0.availableSizes })).sorted { size1, size2 in
            guard let d1 = Double(size1), let d2 = Double(size2) else { return size1 < size2 }
            return d1 < d2
        }
    }
    
    var filteredSneakers: [Sneaker] {
        var filtered = allSneakers
        
        // Search text filter
        if !searchText.isEmpty {
            filtered = filtered.filter { sneaker in
                sneaker.name.localizedCaseInsensitiveContains(searchText) ||
                sneaker.brand.localizedCaseInsensitiveContains(searchText) ||
                sneaker.colorway.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        // Brand filter
        if let brand = selectedBrand {
            filtered = filtered.filter { $0.brand == brand }
        }
        
        // Size filter
        if let size = selectedSize {
            filtered = filtered.filter { $0.availableSizes.contains(size) }
        }
        
        // Price filter
        filtered = filtered.filter { priceRange.matches($0.price) }
        
        return filtered
    }
    
    func clearFilters() {
        selectedBrand = nil
        selectedSize = nil
        priceRange = .all
    }
    
    var hasActiveFilters: Bool {
        selectedBrand != nil || selectedSize != nil || priceRange != .all
    }
}

