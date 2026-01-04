//
//  TermsScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct TermsScreen: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "1a1a1a")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Terms & Conditions")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        Text("Last updated: January 2026")
                            .font(.system(size: 14))
                            .foregroundColor(Color(hex: "8a8a8a"))
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("1. Acceptance of Terms")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                            Text("By using this app, you agree to be bound by these Terms and Conditions.")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "8a8a8a"))
                        }
                        .padding()
                        .background(Color(hex: "222222"))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("2. Product Authenticity")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                            Text("All products are authenticated before shipping. We guarantee authenticity or your money back.")
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
            .navigationTitle("Terms & Conditions")
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

