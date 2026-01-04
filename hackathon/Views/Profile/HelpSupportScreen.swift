//
//  HelpSupportScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct HelpSupportScreen: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "1a1a1a")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Frequently Asked Questions")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            
                            FAQItem(question: "How do I verify authenticity?", answer: "All products go through our rigorous authentication process before shipping.")
                            FAQItem(question: "What is your return policy?", answer: "You can return items within 30 days of delivery in original condition.")
                            FAQItem(question: "How long does shipping take?", answer: "Shipping typically takes 3-5 business days after authentication.")
                            FAQItem(question: "How do I track my order?", answer: "You can track your order in the Orders section using your tracking number.")
                        }
                        .padding(.top, 20)
                    }
                }
            }
            .navigationTitle("Help & Support")
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

