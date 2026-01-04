//
//  BottomNav.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct BottomNav: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            NavButton(icon: "house.fill", title: "Home", isSelected: selectedTab == 0) {
                selectedTab = 0
            }
            
            Spacer()
            
            NavButton(icon: "magnifyingglass", title: "Search", isSelected: selectedTab == 1) {
                selectedTab = 1
            }
            
            Spacer()
            
            NavButton(icon: "bag.fill", title: "Orders", isSelected: selectedTab == 2) {
                selectedTab = 2
            }
            
            Spacer()
            
            NavButton(icon: "person.fill", title: "Profile", isSelected: selectedTab == 3) {
                selectedTab = 3
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(Color(hex: "222222"))
        .cornerRadius(20)
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

