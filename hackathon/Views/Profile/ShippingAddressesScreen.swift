//
//  ShippingAddressesScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct ShippingAddressesScreen: View {
    @Environment(\.dismiss) var dismiss
    @State private var showAddAddress = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "1a1a1a")
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    Image(systemName: "location")
                        .font(.system(size: 60))
                        .foregroundColor(Color(hex: "4a4a4a"))
                    
                    Text("No addresses saved")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                    
                    Text("Add a shipping address to continue")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "8a8a8a"))
                    
                    Button(action: {
                        showAddAddress = true
                    }) {
                        Text("Add Address")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color(hex: "1a1a1a"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: "a8e6cf"))
                            .cornerRadius(12)
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 20)
                    
                    Spacer()
                }
            }
            .navigationTitle("Shipping Addresses")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(Color(hex: "a8e6cf"))
                }
            }
            .sheet(isPresented: $showAddAddress) {
                AddShippingAddressScreen()
            }
        }
    }
}

