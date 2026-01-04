//
//  ProfileViewModel.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import Foundation
import SwiftUI
import Combine

class ProfileViewModel: ObservableObject {
    @Published var showSettings = false
    @Published var showFavorites = false
    @Published var showNotifications = false
    @Published var showPaymentMethods = false
    @Published var showShippingAddresses = false
    @Published var showHelpSupport = false
    @Published var notificationsEnabled = true
    @Published var emailNotifications = true
    @Published var pushNotifications = true
    @Published var darkMode = true
    
    var favoritesCount: Int {
        8
    }
    
    var ordersCount: Int {
        3
    }
}

