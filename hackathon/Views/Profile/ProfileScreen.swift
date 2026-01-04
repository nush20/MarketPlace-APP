//
//  ProfileScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct ProfileScreen: View {
    @Binding var selectedTab: Int
    @StateObject private var viewModel = ProfileViewModel()
    @StateObject private var orderViewModel = OrderViewModel()
    @State private var showSettings = false
    @State private var showFavorites = false
    @State private var showNotifications = false
    @State private var showPaymentMethods = false
    @State private var showShippingAddresses = false
    @State private var showHelpSupport = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                // Profile Header
                VStack(spacing: 16) {
                    Circle()
                        .fill(Color(hex: "2a2a2a"))
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(systemName: "person.fill")
                                .font(.system(size: 50))
                                .foregroundColor(Color(hex: "a8e6cf"))
                        )
                    
                    Text("Anushka")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("anushka@example.com")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "8a8a8a"))
                }
                .padding(.top, 40)
                
                // Stats
                HStack(spacing: 20) {
                    StatCard(title: "Orders", value: "\(orderViewModel.orders.count)")
                    StatCard(title: "Favorites", value: "\(viewModel.favoritesCount)")
                    StatCard(title: "Verified", value: "100%")
                }
                .padding(.horizontal)
                
                // Menu Items
                VStack(spacing: 12) {
                    ProfileMenuItem(icon: "bag.fill", title: "My Orders", action: {
                        selectedTab = 2 // Navigate to Orders tab
                    })
                    ProfileMenuItem(icon: "heart.fill", title: "Favorites", action: {
                        showFavorites = true
                    })
                    ProfileMenuItem(icon: "bell.fill", title: "Notifications", action: {
                        showNotifications = true
                    })
                    ProfileMenuItem(icon: "creditcard.fill", title: "Payment Methods", action: {
                        showPaymentMethods = true
                    })
                    ProfileMenuItem(icon: "location.fill", title: "Shipping Addresses", action: {
                        showShippingAddresses = true
                    })
                    ProfileMenuItem(icon: "gearshape.fill", title: "Settings", action: {
                        showSettings = true
                    })
                    ProfileMenuItem(icon: "questionmark.circle.fill", title: "Help & Support", action: {
                        showHelpSupport = true
                    })
                }
                .padding(.horizontal)
                .padding(.bottom, 100)
            }
        }
        .background(Color(hex: "1a1a1a"))
        .sheet(isPresented: $showSettings) {
            SettingsScreen()
        }
        .sheet(isPresented: $showFavorites) {
            FavoritesScreen()
        }
        .sheet(isPresented: $showNotifications) {
            NotificationsScreen()
        }
        .sheet(isPresented: $showPaymentMethods) {
            PaymentMethodsScreen()
        }
        .sheet(isPresented: $showShippingAddresses) {
            ShippingAddressesScreen()
        }
        .sheet(isPresented: $showHelpSupport) {
            HelpSupportScreen()
        }
    }
}

