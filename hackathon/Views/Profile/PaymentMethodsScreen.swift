//
//  PaymentMethodsScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct PaymentMethodsScreen: View {
    @Environment(\.dismiss) var dismiss
    @State private var showAddPayment = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "1a1a1a")
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    Image(systemName: "creditcard")
                        .font(.system(size: 60))
                        .foregroundColor(Color(hex: "4a4a4a"))
                    
                    Text("No payment methods")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                    
                    Text("Add a payment method to get started")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "8a8a8a"))
                    
                    Button(action: {
                        showAddPayment = true
                    }) {
                        Text("Add Payment Method")
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
            .navigationTitle("Payment Methods")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(Color(hex: "a8e6cf"))
                }
            }
            .sheet(isPresented: $showAddPayment) {
                AddPaymentMethodScreen()
            }
        }
    }
}

