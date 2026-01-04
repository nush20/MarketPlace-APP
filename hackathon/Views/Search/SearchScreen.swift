//
//  SearchScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct SearchScreen: View {
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            Color(hex: "1a1a1a")
                .ignoresSafeArea()
                .overlay(
                    VStack(spacing: 0) {
                        // Search Bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(hex: "6a6a6a"))
                            
                            TextField("Search by brand, model, or size", text: $viewModel.searchText)
                                .foregroundColor(.white)
                                .font(.system(size: 16))
                        }
                        .padding()
                        .background(Color(hex: "2a2a2a"))
                        .cornerRadius(16)
                        .shadow(color: Color(hex: "a8e6cf").opacity(viewModel.searchText.isEmpty ? 0 : 0.1), radius: 10)
                        .padding(.horizontal)
                        .padding(.top, 20)
                        
                        // Filter Chips
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                // Brand Filter
                                FilterChip(
                                    title: viewModel.selectedBrand ?? "Brand",
                                    isSelected: viewModel.selectedBrand != nil,
                                    showChevron: true
                                ) {
                                    viewModel.showingBrandFilter = true
                                }
                                
                                // Size Filter
                                FilterChip(
                                    title: viewModel.selectedSize != nil ? "Size: \(viewModel.selectedSize!)" : "Size",
                                    isSelected: viewModel.selectedSize != nil,
                                    showChevron: true
                                ) {
                                    viewModel.showingSizeFilter = true
                                }
                                
                                // Price Filter
                                FilterChip(
                                    title: viewModel.priceRange.rawValue,
                                    isSelected: viewModel.priceRange != .all,
                                    showChevron: true
                                ) {
                                    viewModel.showingPriceFilter = true
                                }
                                
                                // Clear Filters
                                if viewModel.hasActiveFilters {
                                    FilterChip(title: "Clear", isSelected: false, showChevron: false) {
                                        viewModel.clearFilters()
                                    }
                                }
                            }
                            .padding(.horizontal)
                            .padding(.top, 16)
                        }
                        
                        // Search Results
                        if !viewModel.searchText.isEmpty || viewModel.hasActiveFilters {
                            ScrollView(showsIndicators: false) {
                                VStack(spacing: 16) {
                                    Text("\(viewModel.filteredSneakers.count) results")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(Color(hex: "8a8a8a"))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal)
                                        .padding(.top, 20)
                                    
                                    ForEach(viewModel.filteredSneakers) { sneaker in
                                        NavigationLink(destination: ProductDetailScreen(sneaker: sneaker, selectedTab: .constant(nil))) {
                                            SearchResultCard(sneaker: sneaker)
                                        }
                                    }
                                }
                                .padding(.bottom, 100)
                            }
                        } else {
                            VStack(spacing: 20) {
                                Spacer()
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 60))
                                    .foregroundColor(Color(hex: "4a4a4a"))
                                Text("Search for sneakers")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(Color(hex: "6a6a6a"))
                                Spacer()
                            }
                        }
                    }
                )
        }
        .sheet(isPresented: $viewModel.showingBrandFilter) {
            FilterSelectionView(
                title: "Select Brand",
                items: viewModel.allBrands,
                selectedItem: $viewModel.selectedBrand
            )
        }
        .sheet(isPresented: $viewModel.showingSizeFilter) {
            FilterSelectionView(
                title: "Select Size",
                items: viewModel.allSizes,
                selectedItem: $viewModel.selectedSize
            )
        }
        .sheet(isPresented: $viewModel.showingPriceFilter) {
            PriceFilterView(selectedRange: $viewModel.priceRange)
        }
    }
}

