//
//  SplashScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct SplashScreen: View {
    @State private var opacity: Double = 0
    @State private var glowOpacity: Double = 0
    @State private var navigateToHome = false
    
    var body: some View {
        ZStack {
            Color(hex: "1a1a1a")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 80))
                    .foregroundColor(Color(hex: "a8e6cf"))
                    .opacity(opacity)
                    .shadow(color: Color(hex: "a8e6cf").opacity(glowOpacity * 0.3), radius: 20)
                
                Text("Verified. Tracked. Trusted.")
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(Color(hex: "8a8a8a"))
                    .opacity(opacity)
            }
            .offset(y: -30)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.2)) {
                opacity = 1
            }
            
            withAnimation(.easeInOut(duration: 1.5).delay(0.8).repeatForever(autoreverses: true)) {
                glowOpacity = 1
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                navigateToHome = true
            }
        }
        .fullScreenCover(isPresented: $navigateToHome) {
            HomeScreen()
        }
    }
}

