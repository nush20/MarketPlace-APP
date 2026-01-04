//
//  HomeScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Color(hex: "1a1a1a")
                    .ignoresSafeArea()
                
                // Show different screens based on selected tab
                Group {
                    switch selectedTab {
                    case 0:
                        HomeContentView()
                    case 1:
                        SearchScreen()
                    case 2:
                        OrdersScreen()
                    case 3:
                        ProfileScreen(selectedTab: $selectedTab)
                    default:
                        HomeContentView()
                    }
                }
                
                // Bottom Navigation
                BottomNav(selectedTab: $selectedTab)
            }
            .navigationBarHidden(true)
        }
    }
}

