//
//  AuthenticityView.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import SwiftUI

struct AuthenticityView: View {
    let authSteps: [AuthStep]
    
    var verifiedCount: Int {
        authSteps.filter { $0.verified }.count
    }
    
    var totalCount: Int {
        authSteps.count
    }
    
    var progressPercentage: Double {
        guard totalCount > 0 else { return 0 }
        return Double(verifiedCount) / Double(totalCount)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Progress Bar
            VStack(alignment: .leading, spacing: 8) {
                Text("Authentication Progress")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(hex: "8a8a8a"))
                
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color(hex: "2a2a2a"))
                        
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color(hex: "a8e6cf"))
                            .frame(width: geo.size.width * progressPercentage)
                    }
                }
                .frame(height: 8)
                
                Text("\(verifiedCount) of \(totalCount) checks complete")
                    .font(.system(size: 12))
                    .foregroundColor(Color(hex: "6a6a6a"))
            }
            .padding(.horizontal)
            
            // Auth Steps
            VStack(spacing: 16) {
                ForEach(authSteps) { step in
                    AuthStepRow(step: step)
                }
            }
            .padding(.horizontal)
        }
    }
}

