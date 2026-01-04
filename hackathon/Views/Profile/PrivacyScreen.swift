//
//  PrivacyScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct PrivacyScreen: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "1a1a1a")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Privacy Policy")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        Text("Last updated: January 2026")
                            .font(.system(size: 14))
                            .foregroundColor(Color(hex: "8a8a8a"))
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Data Collection")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                            Text("We collect only the information necessary to process your orders and improve your experience.")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "8a8a8a"))
                        }
                        .padding()
                        .background(Color(hex: "222222"))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Data Security")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                            Text("Your personal information is encrypted and stored securely. We never share your data with third parties.")
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
            .navigationTitle("Privacy Policy")
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

