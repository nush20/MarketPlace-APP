//
//  FilterSelectionView.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct FilterSelectionView: View {
    let title: String
    let items: [String]
    @Binding var selectedItem: String?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "1a1a1a")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(items, id: \.self) { item in
                            Button(action: {
                                if selectedItem == item {
                                    selectedItem = nil
                                } else {
                                    selectedItem = item
                                }
                                dismiss()
                            }) {
                                HStack {
                                    Text(item)
                                        .font(.system(size: 16))
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    if selectedItem == item {
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
            .navigationTitle(title)
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

