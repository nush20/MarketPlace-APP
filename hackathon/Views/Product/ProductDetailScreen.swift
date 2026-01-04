//
//  ProductDetailScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct ProductDetailScreen: View {
    let sneaker: Sneaker
    @Binding var selectedTab: Int?
    @StateObject private var viewModel: ProductDetailViewModel
    @State private var defaultTab = 0
    
    init(sneaker: Sneaker, selectedTab: Binding<Int?>) {
        self.sneaker = sneaker
        self._selectedTab = selectedTab
        self._viewModel = StateObject(wrappedValue: ProductDetailViewModel(sneaker: sneaker))
    }
    
    var tabBinding: Binding<Int> {
        if let tab = selectedTab {
            return Binding(
                get: { tab },
                set: { selectedTab = $0 }
            )
        } else {
            return $defaultTab
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(hex: "1a1a1a")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    // Image Carousel
                    TabView {
                        ForEach(0..<3) { i in
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(hex: "2a2a2a"))
                                
                                AsyncImage(url: URL(string: sneaker.imageUrl)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                            .tint(Color(hex: "a8e6cf"))
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: UIScreen.main.bounds.width - 40, height: 350)
                                    case .failure:
                                        Image(systemName: "photo")
                                            .font(.system(size: 80))
                                            .foregroundColor(Color(hex: "4a4a4a"))
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                            }
                            .frame(height: 350)
                            .clipped()
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 350)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        // Product Info
                        VStack(alignment: .leading, spacing: 8) {
                            Text(sneaker.brand)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Color(hex: "8a8a8a"))
                            
                            Text(sneaker.name)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text(sneaker.colorway)
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "6a6a6a"))
                            
                            HStack(spacing: 12) {
                                Text("₹\(formatPrice(sneaker.retailPrice))")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color(hex: "6a6a6a"))
                                    .strikethrough()
                                
                                Text("₹\(formatPrice(sneaker.price))")
                                    .font(.system(size: 26, weight: .bold))
                                    .foregroundColor(Color(hex: "a8e6cf"))
                            }
                        }
                        .padding(.horizontal)
                        
                        // Size Selector
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Select Size")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                            
                            if viewModel.sortedSizes.isEmpty {
                                Text("No sizes available")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(hex: "8a8a8a"))
                                    .padding(.horizontal)
                            } else {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 12) {
                                        ForEach(viewModel.sortedSizes, id: \.self) { size in
                                            SizePill(size: size, isSelected: viewModel.selectedSize == size) {
                                                viewModel.selectedSize = size
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        // Tabs
                        Picker("", selection: $viewModel.detailTab) {
                            Text("Overview").tag(0)
                            Text("Authenticity").tag(1)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)
                        
                        if viewModel.detailTab == 0 {
                            OverviewView(sneaker: sneaker)
                        } else if viewModel.detailTab == 1 {
                            AuthenticityView(authSteps: viewModel.authSteps)
                        }
                        
                        Spacer(minLength: 100)
                    }
                }
            }
            
            // CTA Button
            VStack {
                NavigationLink(destination: SellerComparisonScreen(sneaker: sneaker, selectedTab: tabBinding)) {
                    Text("Compare Sellers")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color(hex: "1a1a1a"))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "a8e6cf"))
                        .cornerRadius(16)
                        .padding(.horizontal)
                }
            }
            .padding(.bottom, 30)
            .background(
                LinearGradient(
                    colors: [Color(hex: "1a1a1a").opacity(0), Color(hex: "1a1a1a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 120)
            )
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if viewModel.selectedSize == nil && !viewModel.sortedSizes.isEmpty {
                viewModel.selectedSize = viewModel.sortedSizes.first
            }
        }
    }
}

