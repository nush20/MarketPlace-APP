//
//  TrackingView.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct TrackingView: View {
    let trackingSteps = [
        TrackingStep(title: "Order Placed", timestamp: "Jan 2, 10:30 AM", completed: true, current: false),
        TrackingStep(title: "Seller Shipped", timestamp: "Jan 2, 2:15 PM", completed: true, current: false),
        TrackingStep(title: "Authentication Center", timestamp: "Jan 3, 9:00 AM", completed: true, current: false),
        TrackingStep(title: "Verified", timestamp: "Jan 3, 4:30 PM", completed: false, current: true),
        TrackingStep(title: "Out for Delivery", timestamp: "", completed: false, current: false),
        TrackingStep(title: "Delivered", timestamp: "", completed: false, current: false)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(Array(trackingSteps.enumerated()), id: \.element.id) { index, step in
                HStack(alignment: .top, spacing: 16) {
                    VStack(spacing: 0) {
                        Circle()
                            .fill(step.current ? Color(hex: "a8e6cf") : (step.completed ? Color(hex: "a8e6cf").opacity(0.5) : Color(hex: "3a3a3a")))
                            .frame(width: 12, height: 12)
                            .shadow(color: step.current ? Color(hex: "a8e6cf").opacity(0.5) : .clear, radius: 8)
                        
                        if index < trackingSteps.count - 1 {
                            Rectangle()
                                .fill(step.completed ? Color(hex: "a8e6cf").opacity(0.3) : Color(hex: "2a2a2a"))
                                .frame(width: 2, height: 40)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(step.title)
                            .font(.system(size: 16, weight: step.current ? .semibold : .regular))
                            .foregroundColor(step.current ? .white : (step.completed ? Color(hex: "8a8a8a") : Color(hex: "4a4a4a")))
                        
                        if !step.timestamp.isEmpty {
                            Text(step.timestamp)
                                .font(.system(size: 13))
                                .foregroundColor(Color(hex: "6a6a6a"))
                        }
                    }
                    
                    Spacer()
                }
                .padding(.bottom, index < trackingSteps.count - 1 ? 0 : 0)
            }
        }
        .padding()
        .background(Color(hex: "222222"))
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

