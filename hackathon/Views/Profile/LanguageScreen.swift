//
//  LanguageScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct LanguageScreen: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedLanguage = "English"
    
    let languages = ["English", "Hindi", "Spanish", "French", "German", "Japanese"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "1a1a1a")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(languages, id: \.self) { language in
                            Button(action: {
                                selectedLanguage = language
                            }) {
                                HStack {
                                    Text(language)
                                        .foregroundColor(.white)
                                    Spacer()
                                    if selectedLanguage == language {
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
            .navigationTitle("Language")
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

