# 👟 Sneaker Trust Marketplace (iOS)

A trust-first sneaker marketplace iOS application built using **SwiftUI** and the **MVVM architecture**, designed for high-value sneaker purchases where authenticity, seller transparency, and delivery tracking matter.

This app allows users to explore sneakers from multiple verified sellers, compare offers, understand the authentication process step-by-step, and track orders from checkout to delivery.

---

## ✨ Key Features

### 🏠 Home & Discovery
- Trending sneaker drops and curated collections  
- Verified sellers with authenticity scores  
- Personalized greetings based on time of day  

### 🔍 Smart Search & Filters
- Search by brand, model, or size  
- Advanced filters for brand, size, and price  
- Real-time filtered results with product count  

### 📦 Product & Trust Flow
- High-quality product image carousel  
- Detailed specifications & size selection  
- **Visible authentication flow** showing how sneakers are verified  
- Trust score and verification stages displayed transparently  

### 🛒 Seller Comparison & Checkout
- Compare multiple sellers for the same sneaker  
- Secure checkout flow  
- Order summary with delivery timeline  

### 🚚 Order Tracking
- Timeline-based order tracking  
- Authentication → Shipping → Delivery flow  
- Order history and status updates  

### 👤 Profile & Settings
- Saved addresses and payment methods  
- Favorites & order statistics  
- Notification, currency & language preferences  
- Dark mode optimized UI  

---

## 🏗 Architecture

The project follows the **MVVM (Model–View–ViewModel)** architecture for clean separation of UI and business logic.

## 🛠 Tech Stack

| Technology | Used |
|----------|-----|
| Language | Swift |
| Framework | SwiftUI |
| Architecture | MVVM |
| iOS Version | iOS 15+ |
| State Management | @State, @StateObject |
| Data | Mock data (backend-ready structure) |

---

## 📱 App Flow

→ Home / Discover  
→ Search & Filters  
→ Product Listing  
→ Product Details  
   → Overview  
   → Authentication  
   → Tracking  
→ Seller Comparison  
→ Checkout  
→ Order Tracking  
→ Profile  

## 🚀 Running the App

```bash
git clone https://github.com/nush20/MarketPlace-APP.git
open MarketPlace\ App.xcodeproj
Select a simulator or physical device → Press Cmd + R
