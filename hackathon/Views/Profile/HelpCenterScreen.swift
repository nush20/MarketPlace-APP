//
//  HelpCenterScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct HelpCenterScreen: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "1a1a1a")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Frequently Asked Questions")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("How do I place an order?")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                            Text("Browse products, select your size, choose a seller, and proceed to checkout.")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "8a8a8a"))
                        }
                        .padding()
                        .background(Color(hex: "222222"))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("How does authentication work?")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                            Text("All products go through our rigorous authentication process before shipping to ensure authenticity.")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "8a8a8a"))
                        }
                        .padding()
                        .background(Color(hex: "222222"))
                        .cornerRadius(12)
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Help Center")
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

