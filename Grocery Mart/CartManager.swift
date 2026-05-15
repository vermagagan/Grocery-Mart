import Foundation
class CartManager{
    static var shared = CartManager()
    private init(){}
    
    
    var items:[Product] = []
    var totalPrice: Int {
        items.reduce(0){$0 + $1.price}
    }
    
    func addtoCart(_ product: Product){
        print("Add Tapped")
        items.append(product)
        
    }
    func removefromCart(_ product: Product){
        items.removeAll {$0.id == product.id}
    }
}
