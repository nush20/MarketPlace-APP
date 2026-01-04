//
//  ProductDetailViewModel.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import Foundation
import SwiftUI
import Combine

class ProductDetailViewModel: ObservableObject {
    @Published var detailTab: Int = 0
    @Published var selectedSize: String?
    
    let sneaker: Sneaker
    
    init(sneaker: Sneaker) {
        self.sneaker = sneaker
        self.selectedSize = sneaker.availableSizes.first
    }
    
    var sortedSizes: [String] {
        sneaker.availableSizes.sorted { size1, size2 in
            guard let d1 = Double(size1), let d2 = Double(size2) else { return size1 < size2 }
            return d1 < d2
        }
    }
    
    var authSteps: [AuthStep] {
        // Different authentication steps based on sneaker ID for variety
        let sneakerHash = sneaker.id.uuidString.hashValue
        let baseIndex = abs(sneakerHash) % 4
        
        switch baseIndex {
        case 0:
            // 3 of 5 verified
            return [
                AuthStep(title: "Visual inspection completed", icon: "eye.fill", verified: true),
                AuthStep(title: "Material quality verified", icon: "checkmark.circle.fill", verified: true),
                AuthStep(title: "Box and packaging authenticated", icon: "box.fill", verified: true),
                AuthStep(title: "Serial number validation", icon: "number", verified: false),
                AuthStep(title: "Final verification pending", icon: "checkmark.seal.fill", verified: false)
            ]
        case 1:
            // 4 of 7 verified
            return [
                AuthStep(title: "Visual inspection completed", icon: "eye.fill", verified: true),
                AuthStep(title: "Material quality verified", icon: "checkmark.circle.fill", verified: true),
                AuthStep(title: "Box and packaging authenticated", icon: "box.fill", verified: true),
                AuthStep(title: "Stitching pattern verified", icon: "scissors", verified: true),
                AuthStep(title: "Serial number validation", icon: "number", verified: false),
                AuthStep(title: "Logo alignment check", icon: "target", verified: false),
                AuthStep(title: "Final verification pending", icon: "checkmark.seal.fill", verified: false)
            ]
        case 2:
            // 6 of 10 verified
            return [
                AuthStep(title: "Visual inspection completed", icon: "eye.fill", verified: true),
                AuthStep(title: "Material quality verified", icon: "checkmark.circle.fill", verified: true),
                AuthStep(title: "Box and packaging authenticated", icon: "box.fill", verified: true),
                AuthStep(title: "Stitching pattern verified", icon: "scissors", verified: true),
                AuthStep(title: "Color match verified", icon: "paintpalette.fill", verified: true),
                AuthStep(title: "Size tag authenticated", icon: "tag.fill", verified: true),
                AuthStep(title: "Serial number validation", icon: "number", verified: false),
                AuthStep(title: "Logo alignment check", icon: "target", verified: false),
                AuthStep(title: "Insole branding check", icon: "rectangle.inset.filled", verified: false),
                AuthStep(title: "Final verification pending", icon: "checkmark.seal.fill", verified: false)
            ]
        default:
            // 5 of 8 verified
            return [
                AuthStep(title: "Visual inspection completed", icon: "eye.fill", verified: true),
                AuthStep(title: "Material quality verified", icon: "checkmark.circle.fill", verified: true),
                AuthStep(title: "Box and packaging authenticated", icon: "box.fill", verified: true),
                AuthStep(title: "Stitching pattern verified", icon: "scissors", verified: true),
                AuthStep(title: "Color match verified", icon: "paintpalette.fill", verified: true),
                AuthStep(title: "Serial number validation", icon: "number", verified: false),
                AuthStep(title: "Logo alignment check", icon: "target", verified: false),
                AuthStep(title: "Final verification pending", icon: "checkmark.seal.fill", verified: false)
            ]
        }
    }
}

