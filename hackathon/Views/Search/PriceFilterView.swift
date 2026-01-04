//
//  PriceFilterView.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct PriceFilterView: View {
    @Binding var selectedRange: PriceRange
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "1a1a1a")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(PriceRange.allCases, id: \.self) { range in
                            Button(action: {
                                selectedRange = range
                                dismiss()
                            }) {
                                HStack {
                                    Text(range.rawValue)
                                        .font(.system(size: 16))
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    if selectedRange == range {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(Color(hex: "a8e6cf"))
                                    }
                                }
                                .padding()
                                .background(Color(hex: "222222"))
                            }
                            
                            Divider()
                                .background(Color(hex: "2a2a2a"))
                        }
                    }
                }
            }
            .navigationTitle("Price Range")
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

