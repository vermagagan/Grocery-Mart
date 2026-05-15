import UIKit

enum Category: String, CaseIterable {
    case fruits = "Fruits"
    case vegetables = "Vegetables"
    case dairy = "Dairy"
    case bakery = "Bakery"
    case beverages = "Beverages"
    
    var icon: String {
        switch self {
        case .fruits:     return "🍎"
        case .vegetables: return "🥦"
        case .dairy:      return "🥛"
        case .bakery:     return "🍞"
        case .beverages:  return "☕️"
        }
    }
}

struct Product: Hashable {
    let id: UUID
    let name: String
    let category: Category
    let price: Int
    let sfSymbol: String
    let description: String
    let unit: String
    
    init(name: String, category: Category, price: Int, sfSymbol: String, description: String, unit: String) {
        self.id = UUID()
        self.name = name
        self.category = category
        self.price = price
        self.sfSymbol = sfSymbol
        self.description = description
        self.unit = unit
    }
}

struct MockData {
    static let products: [Product] = [
        
        // MARK: Fruits
        Product(name: "Apple",
                category: .fruits,
                price: 40,
                sfSymbol: "apple.logo",
                description: "Fresh red apples sourced from Himachal Pradesh. Rich in fiber and antioxidants.",
                unit: "per kg"),
        
        Product(name: "Banana",
                category: .fruits,
                price: 25,
                sfSymbol: "leaf.fill",
                description: "Ripe yellow bananas. Great source of potassium and natural energy.",
                unit: "per dozen"),
        
        Product(name: "Mango",
                category: .fruits,
                price: 80,
                sfSymbol: "sun.max.fill",
                description: "Alphonso mangoes — the king of fruits. Sweet, juicy and aromatic.",
                unit: "per kg"),
        
        Product(name: "Grapes",
                category: .fruits,
                price: 60,
                sfSymbol: "circle.grid.3x3.fill",
                description: "Seedless green grapes. Perfect for snacking or fruit salads.",
                unit: "per kg"),
        
        Product(name: "Watermelon",
                category: .fruits,
                price: 30,
                sfSymbol: "drop.fill",
                description: "Fresh watermelon. 92% water content — perfect for summers.",
                unit: "per kg"),
        
        // MARK: Vegetables
        Product(name: "Tomato",
                category: .vegetables,
                price: 20,
                sfSymbol: "circle.fill",
                description: "Farm fresh tomatoes. Essential for Indian cooking.",
                unit: "per kg"),
        
        Product(name: "Onion",
                category: .vegetables,
                price: 35,
                sfSymbol: "tornado",
                description: "Red onions with strong flavor. Kitchen staple.",
                unit: "per kg"),
        
        Product(name: "Spinach",
                category: .vegetables,
                price: 15,
                sfSymbol: "leaf.fill",
                description: "Fresh green spinach leaves. High in iron and vitamins.",
                unit: "per bunch"),
        
        Product(name: "Carrot",
                category: .vegetables,
                price: 25,
                sfSymbol: "arrow.down.to.line",
                description: "Crunchy orange carrots. Rich in beta-carotene and Vitamin A.",
                unit: "per kg"),
        
        Product(name: "Potato",
                category: .vegetables,
                price: 18,
                sfSymbol: "oval.fill",
                description: "Fresh potatoes from UP farms. Versatile and filling.",
                unit: "per kg"),
        
        // MARK: Dairy
        Product(name: "Milk",
                category: .dairy,
                price: 60,
                sfSymbol: "drop.fill",
                description: "Full cream fresh milk. Pasteurised and homogenised.",
                unit: "per litre"),
        
        Product(name: "Paneer",
                category: .dairy,
                price: 90,
                sfSymbol: "square.fill",
                description: "Fresh cottage cheese made from whole milk. Soft and creamy.",
                unit: "per 200g"),
        
        Product(name: "Curd",
                category: .dairy,
                price: 45,
                sfSymbol: "circle.fill",
                description: "Thick set curd made from fresh milk. Probiotic rich.",
                unit: "per 400g"),
        
        Product(name: "Butter",
                category: .dairy,
                price: 55,
                sfSymbol: "rectangle.fill",
                description: "Creamy salted butter. Made from fresh cream.",
                unit: "per 100g"),
        
        Product(name: "Cheese",
                category: .dairy,
                price: 120,
                sfSymbol: "square.grid.2x2.fill",
                description: "Processed cheese slices. Perfect for sandwiches and burgers.",
                unit: "per 200g"),
        
        // MARK: Bakery
        Product(name: "Bread",
                category: .bakery,
                price: 40,
                sfSymbol: "rectangle.stack.fill",
                description: "Soft whole wheat sandwich bread. Freshly baked daily.",
                unit: "per loaf"),
        
        Product(name: "Croissant",
                category: .bakery,
                price: 35,
                sfSymbol: "moon.fill",
                description: "Buttery flaky croissant. Baked fresh every morning.",
                unit: "per piece"),
        
        Product(name: "Muffin",
                category: .bakery,
                price: 30,
                sfSymbol: "circle.square.fill",
                description: "Blueberry muffin with a soft crumbly top. Freshly baked.",
                unit: "per piece"),
        
        Product(name: "Cookies",
                category: .bakery,
                price: 50,
                sfSymbol: "circle.grid.2x2.fill",
                description: "Chocolate chip cookies. Crispy on the outside, chewy inside.",
                unit: "per pack of 6"),
        
        Product(name: "Cake Slice",
                category: .bakery,
                price: 70,
                sfSymbol: "triangle.fill",
                description: "Fresh chocolate truffle cake slice from the bakery.",
                unit: "per slice"),
        
        // MARK: Beverages
        Product(name: "Orange Juice",
                category: .beverages,
                price: 80,
                sfSymbol: "cup.and.saucer.fill",
                description: "Cold pressed fresh orange juice. No added sugar.",
                unit: "per 500ml"),
        
        Product(name: "Green Tea",
                category: .beverages,
                price: 120,
                sfSymbol: "leaf.fill",
                description: "Premium Darjeeling green tea. Rich in antioxidants.",
                unit: "per 25 bags"),
        
        Product(name: "Coffee",
                category: .beverages,
                price: 200,
                sfSymbol: "cup.and.saucer.fill",
                description: "100% Arabica ground coffee from Coorg plantations.",
                unit: "per 250g"),
        
        Product(name: "Coconut Water",
                category: .beverages,
                price: 50,
                sfSymbol: "drop.circle.fill",
                description: "Natural tender coconut water. Refreshing and hydrating.",
                unit: "per 250ml"),
        
        Product(name: "Lassi",
                category: .beverages,
                price: 40,
                sfSymbol: "cylinder.fill",
                description: "Sweet punjabi lassi made from fresh curd. Chilled and creamy.",
                unit: "per 300ml"),
    ]
    
    static func products(for category: Category) -> [Product] {
        return products.filter { $0.category == category }
    }
}
