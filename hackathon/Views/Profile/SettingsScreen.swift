//
//  SettingsScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct SettingsScreen: View {
    @Environment(\.dismiss) var dismiss
    @State private var notificationsEnabled = true
    @State private var emailNotifications = true
    @State private var pushNotifications = true
    @State private var darkMode = true
    
    @State private var showEditProfile = false
    @State private var showChangePassword = false
    @State private var showLanguage = false
    @State private var showCurrency = false
    @State private var showHelpCenter = false
    @State private var showTerms = false
    @State private var showPrivacy = false
    @State private var showAbout = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "1a1a1a")
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        // Account Section
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Account")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(hex: "8a8a8a"))
                                .padding(.horizontal)
                                .padding(.top, 20)
                            
                            SettingsRow(icon: "person.fill", title: "Edit Profile", action: {
                                showEditProfile = true
                            })
                            SettingsRow(icon: "envelope.fill", title: "Email", value: "anushka@example.com", showArrow: false, action: {})
                            SettingsRow(icon: "lock.fill", title: "Change Password", action: {
                                showChangePassword = true
                            })
                        }
                        .padding(.bottom, 24)
                        
                        // Notifications Section
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Notifications")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(hex: "8a8a8a"))
                                .padding(.horizontal)
                            
                            ToggleSettingsRow(icon: "bell.fill", title: "Push Notifications", isOn: $pushNotifications)
                            ToggleSettingsRow(icon: "envelope.fill", title: "Email Notifications", isOn: $emailNotifications)
                            ToggleSettingsRow(icon: "cart.fill", title: "Order Updates", isOn: $notificationsEnabled)
                        }
                        .padding(.bottom, 24)
                        
                        // Preferences Section
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Preferences")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(hex: "8a8a8a"))
                                .padding(.horizontal)
                            
                            ToggleSettingsRow(icon: "moon.fill", title: "Dark Mode", isOn: $darkMode)
                            SettingsRow(icon: "globe", title: "Language", value: "English", action: {
                                showLanguage = true
                            })
                            SettingsRow(icon: "indianrupeesign.circle.fill", title: "Currency", value: "INR (₹)", action: {
                                showCurrency = true
                            })
                        }
                        .padding(.bottom, 24)
                        
                        // Support Section
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Support")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(hex: "8a8a8a"))
                                .padding(.horizontal)
                            
                            SettingsRow(icon: "questionmark.circle.fill", title: "Help Center", action: {
                                showHelpCenter = true
                            })
                            SettingsRow(icon: "doc.text.fill", title: "Terms & Conditions", action: {
                                showTerms = true
                            })
                            SettingsRow(icon: "hand.raised.fill", title: "Privacy Policy", action: {
                                showPrivacy = true
                            })
                            SettingsRow(icon: "info.circle.fill", title: "About", value: "Version 1.0.0", showArrow: false, action: {
                                showAbout = true
                            })
                        }
                        .padding(.bottom, 24)
                        
                        // Sign Out
                        Button(action: {}) {
                            HStack {
                                Spacer()
                                Text("Sign Out")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.red)
                                Spacer()
                            }
                            .padding()
                            .background(Color(hex: "222222"))
                            .cornerRadius(12)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 40)
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(Color(hex: "a8e6cf"))
                }
            }
            .sheet(isPresented: $showEditProfile) {
                EditProfileScreen()
            }
            .sheet(isPresented: $showChangePassword) {
                ChangePasswordScreen()
            }
            .sheet(isPresented: $showLanguage) {
                LanguageScreen()
            }
            .sheet(isPresented: $showCurrency) {
                CurrencyScreen()
            }
            .sheet(isPresented: $showHelpCenter) {
                HelpCenterScreen()
            }
            .sheet(isPresented: $showTerms) {
                TermsScreen()
            }
            .sheet(isPresented: $showPrivacy) {
                PrivacyScreen()
            }
            .sheet(isPresented: $showAbout) {
                AboutScreen()
            }
        }
    }
}

