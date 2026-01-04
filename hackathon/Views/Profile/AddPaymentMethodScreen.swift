//
//  AddPaymentMethodScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct AddPaymentMethodScreen: View {
    @Environment(\.dismiss) var dismiss
    @State private var cardNumber = ""
    @State private var cardName = ""
    @State private var expiryDate = ""
    @State private var cvv = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "1a1a1a")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        // Card Preview
                        RoundedRectangle(cornerRadius: 16)
                            .fill(
                                LinearGradient(
                                    colors: [Color(hex: "2a2a2a"), Color(hex: "3a3a3a")],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(height: 200)
                            .overlay(
                                VStack(alignment: .leading, spacing: 16) {
                                    Text("Card Number")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color(hex: "8a8a8a"))
                                    Text(cardNumber.isEmpty ? "•••• •••• •••• ••••" : cardNumber)
                                        .font(.system(size: 20, weight: .medium, design: .monospaced))
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    HStack {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Cardholder Name")
                                                .font(.system(size: 10))
                                                .foregroundColor(Color(hex: "8a8a8a"))
                                            Text(cardName.isEmpty ? "YOUR NAME" : cardName)
                                                .font(.system(size: 14, weight: .medium))
                                                .foregroundColor(.white)
                                        }
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Expiry")
                                                .font(.system(size: 10))
                                                .foregroundColor(Color(hex: "8a8a8a"))
                                            Text(expiryDate.isEmpty ? "MM/YY" : expiryDate)
                                                .font(.system(size: 14, weight: .medium))
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                                .padding(20)
                            )
                            .padding(.horizontal)
                            .padding(.top, 20)
                        
                        // Form Fields
                        VStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Card Number")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.white)
                                TextField("1234 5678 9012 3456", text: $cardNumber)
                                    .keyboardType(.numberPad)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(hex: "222222"))
                                    .cornerRadius(12)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Cardholder Name")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.white)
                                TextField("John Doe", text: $cardName)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(hex: "222222"))
                                    .cornerRadius(12)
                            }
                            
                            HStack(spacing: 16) {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Expiry Date")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(.white)
                                    TextField("MM/YY", text: $expiryDate)
                                        .keyboardType(.numberPad)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color(hex: "222222"))
                                        .cornerRadius(12)
                                }
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("CVV")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(.white)
                                    TextField("123", text: $cvv)
                                        .keyboardType(.numberPad)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color(hex: "222222"))
                                        .cornerRadius(12)
                                }
                            }
                            
                            Button(action: {
                                // Save payment method
                                dismiss()
                            }) {
                                Text("Save Payment Method")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(Color(hex: "1a1a1a"))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color(hex: "a8e6cf"))
                                    .cornerRadius(12)
                            }
                            .padding(.top, 8)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 40)
                    }
                }
            }
            .navigationTitle("Add Payment Method")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(Color(hex: "a8e6cf"))
                }
            }
        }
    }
}

