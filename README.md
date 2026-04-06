# 🛒 GroceryMart — iOS Shopping App

> App #3 of my iOS Development Journey | Built with Swift + UIKit | Zero Storyboards

---

## 📱 Overview

GroceryMart is a fully programmatic iOS grocery shopping app that lets users browse products by category and manage a real-time shopping cart. Built as part of my structured iOS curriculum to master `UITableView`, `UICollectionView`, Diffable Data Sources, and shared state management.

---

## 🖥️ Screens

### 🏠 Home Screen
- Horizontal `UICollectionView` with category chips — Fruits, Vegetables, Dairy, Bakery, Beverages
- `UITableView` below showing products filtered by selected category
- Each product row: SF Symbol image, name, price, and **Add to Cart** button
- Pull to refresh support
- Live cart badge on navigation bar button

### 📦 Product Detail Screen
- Pushed via `UINavigationController` on row tap
- Displays large SF Symbol, product name, price, and description
- **Add to Cart** button at the bottom

### 🛒 Cart Screen
- Presented as a modal from the nav bar cart button
- Lists all added items with name, price, and delete button
- Swipe-to-delete support
- Live total price at the bottom
- Empty state message when cart is empty

---

## ⚙️ Features

| Feature | Detail |
|---|---|
| Category filtering | Smooth animated updates via Diffable Data Source |
| Shared cart state | `CartManager` singleton accessible across all screens |
| Live badge count | Updates on every add / remove action |
| Swipe to delete | Native `UITableView` swipe action on Cart screen |
| Pull to refresh | `UIRefreshControl` on Home screen |
| Empty state | Friendly message shown when cart is empty |

---

## 🛠️ Tech Stack

- **Language:** Swift
- **Framework:** UIKit
- **UI Approach:** 100% Programmatic — Zero Storyboards
- **Layout:** `NSLayoutConstraint` + `UIStackView`
- **Data:** `NSDiffableDataSource` + `NSDiffableDataSourceSnapshot`
- **Architecture:** Singleton pattern (`CartManager`)
- **Navigation:** `UINavigationController` (push) + Modal presentation
- **Custom Cells:** `UITableViewCell` + `UICollectionViewCell` subclasses

---

## 🧠 Concepts Practiced

| Concept | Where Used |
|---|---|
| `UITableView` datasource + delegate | Products list + Cart screen |
| Custom `UITableViewCell` | `ProductCell`, `CartCell` |
| `UICollectionView` | Category chips |
| Diffable Data Source | Filtering products by category |
| `NSDiffableDataSourceSnapshot` | Animated list updates |
| Swipe to delete | `CartVC` |
| Pull to refresh | `HomeVC` |
| `UINavigationController` push | Home → Product Detail |
| Modal presentation | Home → Cart |
| Nav bar badge | Cart item count |
| Singleton pattern | `CartManager.swift` |

---

## 🚀 Getting Started

1. Clone the repo
   ```bash
   git clone https://github.com/YOUR_USERNAME/GroceryMart-iOS.git
   ```
2. Open `GroceryMart.xcodeproj` in Xcode
3. Run on Simulator (iOS 16+)

> No third-party dependencies. No CocoaPods. Pure UIKit.

---


## 👨‍💻 Author

**Gagan**
Aspiring iOS Developer | Building in public

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](https://linkedin.com/in/vermagagan)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black)](https://github.com/vermagagan)

---

> *"Every app in this series is more complex than the last. This one had custom cells, a shared singleton, animated diffable updates, and zero storyboards."*
