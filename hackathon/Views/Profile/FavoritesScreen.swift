//
//  FavoritesScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct FavoritesScreen: View {
    @Environment(\.dismiss) var dismiss
    
    let favoriteSneakers = Array(Sneaker.sampleSneakers.prefix(8))
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "1a1a1a")
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        ForEach(favoriteSneakers) { sneaker in
                            NavigationLink(destination: ProductDetailScreen(sneaker: sneaker, selectedTab: .constant(nil))) {
                                SearchResultCard(sneaker: sneaker)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Favorites")
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

