//
//  Models.swift
//  hackathon
//
//  Created by Anushka on 02/01/2026.
//

import Foundation

// MARK: - Models

struct Sneaker: Identifiable {
    let id = UUID()
    let name: String
    let brand: String
    let price: Double
    let retailPrice: Double
    let imageUrl: String
    let verified: Bool
    let trustScore: Double
    let availableSizes: [String]
    let colorway: String
}

extension Sneaker {
    static let sampleSneakers: [Sneaker] = [
        Sneaker(name: "Air Jordan 1 Retro High OG 'Chicago'", brand: "Nike", price: 23990, retailPrice: 14100, imageUrl: "https://i.pinimg.com/1200x/8e/d2/60/8ed260335b56c59b2ba707112f1414fb.jpg", verified: true, trustScore: 98, availableSizes: ["8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5"], colorway: "Chicago Red"),
        Sneaker(name: "Yeezy Boost 350 V2 'Zebra'", brand: "Adidas", price: 26560, retailPrice: 18260, imageUrl: "https://i.pinimg.com/1200x/f8/66/fa/f866fa20197a79638a234a03624d5e34.jpg", verified: true, trustScore: 95, availableSizes: ["7", "7.5", "8", "9", "10", "11", "12", "13"], colorway: "Zebra"),
        Sneaker(name: "Dunk Low 'Panda'", brand: "Nike", price: 14940, retailPrice: 9130, imageUrl: "https://i.pinimg.com/1200x/c3/f7/0b/c3f70b37e4bb564fa10c1621b476e482.jpg", verified: true, trustScore: 97, availableSizes: ["8.5", "9", "9.5", "10", "10.5", "11"], colorway: "Black White"),
        Sneaker(name: "Air Force 1 '07 White", brand: "Nike", price: 9960, retailPrice: 7470, imageUrl: "https://i.pinimg.com/1200x/36/c3/a0/36c3a0b71aacbf9cdaf8e0c574368e63.jpg", verified: true, trustScore: 96, availableSizes: ["7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12"], colorway: "Triple White"),
        Sneaker(name: "Chuck Taylor All Star High Top", brand: "Converse", price: 5395, retailPrice: 4565, imageUrl: "https://i.pinimg.com/1200x/b6/fc/37/b6fc37b37676a94383b3ec6d463b84e6.jpg", verified: true, trustScore: 94, availableSizes: ["6", "7", "8", "9", "10", "11"], colorway: "Black"),
        Sneaker(name: "Superstar Originals", brand: "Adidas", price: 6640, retailPrice: 5810, imageUrl: "https://i.pinimg.com/1200x/08/7f/a2/087fa2545cadeca8e5b8165cba8f5bea.jpg", verified: true, trustScore: 93, availableSizes: ["7", "8", "9", "10", "11", "12"], colorway: "White/Black"),
        Sneaker(name: "Air Max 90 'Infrared'", brand: "Nike", price: 11620, retailPrice: 9960, imageUrl: "https://i.pinimg.com/1200x/e4/07/26/e40726772fd074ef0e625caca814aa68.jpg", verified: true, trustScore: 96, availableSizes: ["8", "9", "9.5", "10", "10.5", "11"], colorway: "Infrared"),
        Sneaker(name: "New Balance 550 'White Grey'", brand: "New Balance", price: 12450, retailPrice: 9130, imageUrl: "https://i.pinimg.com/1200x/b9/2b/6a/b92b6a1a571551dcda6d3f4923aeb2bc.jpg", verified: true, trustScore: 95, availableSizes: ["8.5", "9", "9.5", "10", "10.5", "11", "11.5"], colorway: "White Grey"),
        Sneaker(name: "Air Jordan 4 'Fire Red'", brand: "Nike", price: 20750, retailPrice: 16600, imageUrl: "https://i.pinimg.com/736x/88/36/00/88360000f2d8feed73119eb58ac4e4a4.jpg", verified: true, trustScore: 97, availableSizes: ["8", "9", "9.5", "10", "11", "12"], colorway: "Fire Red"),
        Sneaker(name: "Dunk High 'Michigan State'", brand: "Nike", price: 16185, retailPrice: 9545, imageUrl: "https://i.pinimg.com/1200x/61/4b/16/614b16e565711abe544fb5c402e777a1.jpg", verified: true, trustScore: 96, availableSizes: ["8.5", "9", "10", "10.5", "11", "12"], colorway: "Green White"),
        Sneaker(name: "Yeezy 700 'Wave Runner'", brand: "Adidas", price: 29050, retailPrice: 24900, imageUrl: "https://i.pinimg.com/1200x/a4/e0/b3/a4e0b36b6d5a0eb73eadfaf75a7bf334.jpg", verified: true, trustScore: 94, availableSizes: ["9", "9.5", "10", "10.5", "11", "11.5"], colorway: "Grey"),
        Sneaker(name: "Travis Scott x Air Jordan 1 Low", brand: "Nike", price: 70550, retailPrice: 12450, imageUrl: "https://i.pinimg.com/736x/d1/08/58/d10858b33e785865a5e94b5ffd0e15a0.jpg", verified: true, trustScore: 99, availableSizes: ["8.5", "9", "10", "10.5"], colorway: "Reverse Mocha"),
        Sneaker(name: "Vans Old Skool", brand: "Vans", price: 5810, retailPrice: 4980, imageUrl: "https://i.pinimg.com/1200x/b6/fc/37/b6fc37b37676a94383b3ec6d463b84e6.jpg", verified: true, trustScore: 92, availableSizes: ["7", "8", "9", "10", "11"], colorway: "Black White"),
        Sneaker(name: "Air Max 97 'Silver Bullet'", brand: "Nike", price: 14940, retailPrice: 13280, imageUrl: "https://i.pinimg.com/1200x/fa/b8/9e/fab89e07b82c7796f6c14754c19bc0b6.jpg", verified: true, trustScore: 95, availableSizes: ["8", "9", "10", "11", "12"], colorway: "Silver"),
        Sneaker(name: "Yeezy Slide 'Bone'", brand: "Adidas", price: 7470, retailPrice: 4980, imageUrl: "https://i.pinimg.com/736x/70/07/7a/70077a6cfb286bdcb98a9ad03e46de8f.jpg", verified: true, trustScore: 91, availableSizes: ["8", "9", "10", "11", "12"], colorway: "Bone")
    ]
}

struct Seller: Identifiable {
    let id = UUID()
    let name: String
    let rating: Double
    let price: Double
    let deliveryDays: Int
    let authenticityScore: Double
    let totalSales: Int
    let joinedDate: String
    let verified: Bool
    let responseRate: Int
    let description: String
}

extension Seller {
    static let trustedSellers: [Seller] = [
        Seller(name: "KicksFederation", rating: 4.9, price: 23990, deliveryDays: 3, authenticityScore: 98, totalSales: 12540, joinedDate: "2018", verified: true, responseRate: 95, description: "Premium authentic sneakers with 100% verification guarantee. Fast shipping and excellent customer service."),
        Seller(name: "Elite Sneaker Vault", rating: 4.8, price: 24485, deliveryDays: 2, authenticityScore: 97, totalSales: 8930, joinedDate: "2019", verified: true, responseRate: 98, description: "Specializing in rare and limited edition sneakers. All items authenticated by experts."),
        Seller(name: "Premium Kicks Co", rating: 4.7, price: 25730, deliveryDays: 4, authenticityScore: 95, totalSales: 15620, joinedDate: "2017", verified: true, responseRate: 92, description: "Trusted seller with over 15,000 sales. Best prices and authentic sneakers guaranteed."),
        Seller(name: "SneakerHead Emporium", rating: 4.9, price: 23200, deliveryDays: 5, authenticityScore: 96, totalSales: 6780, joinedDate: "2020", verified: true, responseRate: 97, description: "Curated selection of the latest sneaker releases and classics."),
        Seller(name: "Authentic Kicks Only", rating: 4.8, price: 24800, deliveryDays: 3, authenticityScore: 99, totalSales: 9870, joinedDate: "2016", verified: true, responseRate: 99, description: "100% authentic sneakers. We verify every pair through our rigorous authentication process.")
    ]
}

struct Order: Identifiable {
    let id: UUID
    let sneaker: Sneaker
    let seller: String
    let status: String
    let orderDate: String
    let trackingNumber: String
}

struct AuthStep: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let verified: Bool
}

struct TrackingStep: Identifiable {
    let id = UUID()
    let title: String
    let timestamp: String
    let completed: Bool
    let current: Bool
}

struct PaymentMethod: Identifiable {
    let id = UUID()
    let last4: String
    let type: String
    let expiry: String
}

struct ShippingAddress: Identifiable {
    let id = UUID()
    let name: String
    let phone: String
    let address: String
    let city: String
    let state: String
    let pincode: String
}

enum PriceRange: String, CaseIterable {
    case all = "All Prices"
    case under5000 = "Under ₹5,000"
    case fiveToTen = "₹5,000 - ₹10,000"
    case tenToTwenty = "₹10,000 - ₹20,000"
    case twentyToFifty = "₹20,000 - ₹50,000"
    case overFifty = "Over ₹50,000"
    
    func matches(_ price: Double) -> Bool {
        switch self {
        case .all: return true
        case .under5000: return price < 5000
        case .fiveToTen: return price >= 5000 && price < 10000
        case .tenToTwenty: return price >= 10000 && price < 20000
        case .twentyToFifty: return price >= 20000 && price < 50000
        case .overFifty: return price >= 50000
        }
    }
}



