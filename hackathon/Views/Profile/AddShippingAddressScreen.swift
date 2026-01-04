//
//  AddShippingAddressScreen.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct AddShippingAddressScreen: View {
    @Environment(\.dismiss) var dismiss
    @State private var fullName = ""
    @State private var phoneNumber = ""
    @State private var addressLine1 = ""
    @State private var addressLine2 = ""
    @State private var city = ""
    @State private var state = ""
    @State private var pincode = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "1a1a1a")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        VStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Full Name")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.white)
                                TextField("Enter your full name", text: $fullName)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(hex: "222222"))
                                    .cornerRadius(12)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Phone Number")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.white)
                                TextField("+91 1234567890", text: $phoneNumber)
                                    .keyboardType(.phonePad)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(hex: "222222"))
                                    .cornerRadius(12)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Address Line 1")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.white)
                                TextField("Street address", text: $addressLine1)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(hex: "222222"))
                                    .cornerRadius(12)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Address Line 2 (Optional)")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.white)
                                TextField("Apartment, suite, etc.", text: $addressLine2)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(hex: "222222"))
                                    .cornerRadius(12)
                            }
                            
                            HStack(spacing: 16) {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("City")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(.white)
                                    TextField("City", text: $city)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color(hex: "222222"))
                                        .cornerRadius(12)
                                }
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("State")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(.white)
                                    TextField("State", text: $state)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color(hex: "222222"))
                                        .cornerRadius(12)
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("PIN Code")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.white)
                                TextField("123456", text: $pincode)
                                    .keyboardType(.numberPad)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(hex: "222222"))
                                    .cornerRadius(12)
                            }
                            
                            Button(action: {
                                // Save address
                                dismiss()
                            }) {
                                Text("Save Address")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(Color(hex: "1a1a1a"))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color(hex: "a8e6cf"))
                                    .cornerRadius(12)
                            }
                            .padding(.top, 8)
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)
                        .padding(.bottom, 40)
                    }
                }
            }
            .navigationTitle("Add Address")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(Color(hex: "a8e6cf"))
                }
            }
        }
    }
}

