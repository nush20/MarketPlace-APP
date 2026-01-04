//
//  CurrencyScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct CurrencyScreen: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedCurrency = "INR (₹)"
    
    let currencies = ["INR (₹)", "USD ($)", "EUR (€)", "GBP (£)", "JPY (¥)"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "1a1a1a")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(currencies, id: \.self) { currency in
                            Button(action: {
                                selectedCurrency = currency
                            }) {
                                HStack {
                                    Text(currency)
                                        .foregroundColor(.white)
                                    Spacer()
                                    if selectedCurrency == currency {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(Color(hex: "a8e6cf"))
                                    }
                                }
                                .padding()
                                .background(Color(hex: "222222"))
                                .cornerRadius(12)
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Currency")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(Color(hex: "a8e6cf"))
                }
            }
        }
    }
}

