//
//  CheckoutScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct CheckoutScreen: View {
    let sneaker: Sneaker
    let seller: Seller
    @Binding var selectedTab: Int
    @StateObject private var viewModel: CheckoutViewModel
    
    init(sneaker: Sneaker, seller: Seller, selectedTab: Binding<Int>? = nil) {
        self.sneaker = sneaker
        self.seller = seller
        self._selectedTab = selectedTab ?? .constant(0)
        self._viewModel = StateObject(wrappedValue: CheckoutViewModel(sneaker: sneaker, seller: seller))
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(hex: "1a1a1a")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    // Order Summary
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Order Summary")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                        
                        HStack(spacing: 16) {
                            AsyncImage(url: URL(string: sneaker.imageUrl)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .tint(Color(hex: "a8e6cf"))
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 80, height: 80)
                                case .failure:
                                    Image(systemName: "photo")
                                        .font(.system(size: 40))
                                        .foregroundColor(Color(hex: "4a4a4a"))
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .frame(width: 80, height: 80)
                            .background(Color(hex: "2a2a2a"))
                            .cornerRadius(12)
                            .clipped()
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text(sneaker.name)
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                    .lineLimit(2)
                                
                                Text("Seller: \(seller.name)")
                                    .font(.system(size: 13))
                                    .foregroundColor(Color(hex: "8a8a8a"))
                                
                                Text("₹\(formatPrice(seller.price))")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(Color(hex: "a8e6cf"))
                            }
                            
                            Spacer()
                        }
                        
                        Divider()
                            .background(Color(hex: "3a3a3a"))
                        
                        HStack {
                            Text("Subtotal")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "8a8a8a"))
                            Spacer()
                            Text("₹\(formatPrice(seller.price))")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                        }
                        
                        HStack {
                            Text("Shipping")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "8a8a8a"))
                            Spacer()
                            Text("Free")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                        }
                        
                        Divider()
                            .background(Color(hex: "3a3a3a"))
                        
                        HStack {
                            Text("Total")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                            Spacer()
                            Text("₹\(formatPrice(seller.price))")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color(hex: "a8e6cf"))
                        }
                    }
                    .padding()
                    .background(Color(hex: "222222"))
                    .cornerRadius(16)
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    // Payment Method Section
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Payment Method")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button(action: {
                                viewModel.showAddPayment = true
                            }) {
                                Text("Add New")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(hex: "a8e6cf"))
                            }
                        }
                        
                        if viewModel.selectedPaymentMethod == nil && viewModel.paymentMethods.isEmpty {
                            Button(action: {
                                viewModel.showAddPayment = true
                            }) {
                                HStack {
                                    Image(systemName: "creditcard")
                                        .foregroundColor(Color(hex: "a8e6cf"))
                                    Text("Add Payment Method")
                                        .foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color(hex: "4a4a4a"))
                                }
                                .padding()
                                .background(Color(hex: "222222"))
                                .cornerRadius(12)
                            }
                        } else {
                            ForEach(viewModel.paymentMethods) { method in
                                Button(action: {
                                    viewModel.selectedPaymentMethod = method
                                }) {
                                    HStack {
                                        Image(systemName: "creditcard.fill")
                                            .foregroundColor(Color(hex: "a8e6cf"))
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("\(method.type) •••• \(method.last4)")
                                                .font(.system(size: 15, weight: .medium))
                                                .foregroundColor(.white)
                                            Text("Expires \(method.expiry)")
                                                .font(.system(size: 12))
                                                .foregroundColor(Color(hex: "8a8a8a"))
                                        }
                                        
                                        Spacer()
                                        
                                        if viewModel.selectedPaymentMethod?.id == method.id {
                                            Circle()
                                                .fill(Color(hex: "a8e6cf"))
                                                .frame(width: 20, height: 20)
                                                .overlay(
                                                    Circle()
                                                        .fill(Color(hex: "1a1a1a"))
                                                        .frame(width: 7, height: 7)
                                                )
                                        } else {
                                            Circle()
                                                .stroke(Color(hex: "4a4a4a"), lineWidth: 2)
                                                .frame(width: 20, height: 20)
                                        }
                                    }
                                    .padding()
                                    .background(viewModel.selectedPaymentMethod?.id == method.id ? Color(hex: "2a2a2a") : Color(hex: "222222"))
                                    .cornerRadius(12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(viewModel.selectedPaymentMethod?.id == method.id ? Color(hex: "a8e6cf").opacity(0.3) : Color.clear, lineWidth: 1)
                                    )
                                }
                            }
                            
                            Button(action: {
                                viewModel.showAddPayment = true
                            }) {
                                HStack {
                                    Image(systemName: "plus.circle")
                                        .foregroundColor(Color(hex: "a8e6cf"))
                                    Text("Add Another Payment Method")
                                        .foregroundColor(Color(hex: "a8e6cf"))
                                    Spacer()
                                }
                                .padding()
                                .background(Color(hex: "222222"))
                                .cornerRadius(12)
                            }
                        }
                    }
                    .padding()
                    .background(Color(hex: "222222"))
                    .cornerRadius(16)
                    .padding(.horizontal)
                    
                    // Shipping Address Section
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Shipping Address")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button(action: {
                                viewModel.showAddAddress = true
                            }) {
                                Text("Add New")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(hex: "a8e6cf"))
                            }
                        }
                        
                        if viewModel.selectedAddress == nil && viewModel.addresses.isEmpty {
                            Button(action: {
                                viewModel.showAddAddress = true
                            }) {
                                HStack {
                                    Image(systemName: "location")
                                        .foregroundColor(Color(hex: "a8e6cf"))
                                    Text("Add Shipping Address")
                                        .foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color(hex: "4a4a4a"))
                                }
                                .padding()
                                .background(Color(hex: "222222"))
                                .cornerRadius(12)
                            }
                        } else {
                            ForEach(viewModel.addresses) { address in
                                Button(action: {
                                    viewModel.selectedAddress = address
                                }) {
                                    VStack(alignment: .leading, spacing: 8) {
                                        HStack {
                                            Text(address.name)
                                                .font(.system(size: 16, weight: .semibold))
                                                .foregroundColor(.white)
                                            
                                            Spacer()
                                            
                                            if viewModel.selectedAddress?.id == address.id {
                                                Circle()
                                                    .fill(Color(hex: "a8e6cf"))
                                                    .frame(width: 20, height: 20)
                                                    .overlay(
                                                        Circle()
                                                            .fill(Color(hex: "1a1a1a"))
                                                            .frame(width: 7, height: 7)
                                                    )
                                            } else {
                                                Circle()
                                                    .stroke(Color(hex: "4a4a4a"), lineWidth: 2)
                                                    .frame(width: 20, height: 20)
                                            }
                                        }
                                        
                                        Text(address.address)
                                            .font(.system(size: 14))
                                            .foregroundColor(Color(hex: "b0b0b0"))
                                        
                                        Text("\(address.city), \(address.state) \(address.pincode)")
                                            .font(.system(size: 14))
                                            .foregroundColor(Color(hex: "8a8a8a"))
                                        
                                        Text(address.phone)
                                            .font(.system(size: 13))
                                            .foregroundColor(Color(hex: "8a8a8a"))
                                    }
                                    .padding()
                                    .background(viewModel.selectedAddress?.id == address.id ? Color(hex: "2a2a2a") : Color(hex: "222222"))
                                    .cornerRadius(12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(viewModel.selectedAddress?.id == address.id ? Color(hex: "a8e6cf").opacity(0.3) : Color.clear, lineWidth: 1)
                                    )
                                }
                            }
                            
                            Button(action: {
                                viewModel.showAddAddress = true
                            }) {
                                HStack {
                                    Image(systemName: "plus.circle")
                                        .foregroundColor(Color(hex: "a8e6cf"))
                                    Text("Add Another Address")
                                        .foregroundColor(Color(hex: "a8e6cf"))
                                    Spacer()
                                }
                                .padding()
                                .background(Color(hex: "222222"))
                                .cornerRadius(12)
                            }
                        }
                    }
                    .padding()
                    .background(Color(hex: "222222"))
                    .cornerRadius(16)
                    .padding(.horizontal)
                    .padding(.bottom, 100)
                }
            }
            
            // Place Order Button
            VStack {
                Button(action: {
                    if viewModel.canPlaceOrder {
                        _ = viewModel.placeOrder()
                        viewModel.showOrderConfirmation = true
                    }
                }) {
                    Text(viewModel.canPlaceOrder ? "Place Order" : "Select Payment & Address")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(viewModel.canPlaceOrder ? Color(hex: "1a1a1a") : Color(hex: "6a6a6a"))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.canPlaceOrder ? Color(hex: "a8e6cf") : Color(hex: "2a2a2a"))
                        .cornerRadius(16)
                        .padding(.horizontal)
                }
                .disabled(!viewModel.canPlaceOrder)
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
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $viewModel.showAddPayment) {
            AddPaymentMethodScreen()
        }
        .sheet(isPresented: $viewModel.showAddAddress) {
            AddShippingAddressScreen()
        }
        .fullScreenCover(isPresented: $viewModel.showOrderConfirmation) {
            OrderConfirmationScreen(sneaker: sneaker, seller: seller, selectedTab: $selectedTab)
        }
    }
}

