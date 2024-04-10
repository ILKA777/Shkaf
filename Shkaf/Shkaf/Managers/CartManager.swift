//
//  CartManager.swift
//  Shkaf
//
//  Created by Илья on 07.02.2024.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [ProductWithQuantity] = []
    @Published private(set) var total: Double = 0.0
    @Published private(set) var totalCount: Int = 0
    
    func addToCart(product: Product) {
        if let index = products.firstIndex(where: { $0.product.id == product.id }) {
            products[index].quantity += 1
        } else {
            products.append(ProductWithQuantity(product: product, quantity: 1))
        }
        recalculateTotal()
    }
    
    func removeFromCart(product: Product) {
        if let index = products.firstIndex(where: { $0.product.id == product.id }) {
            if products[index].quantity > 1 {
                products[index].quantity -= 1
            } else {
                products.remove(at: index)
            }
            recalculateTotal()
        }
    }
    
    func clearCart() {
        products.removeAll()
        total = 0.0
    }
    
    private func recalculateTotal() {
        total = products.reduce(0.0) { $0 + ($1.product.price * Double($1.quantity)) }
        totalCount = products.reduce(0) { $0 + $1.quantity }
    }
    
    func quantity(for product: Product) -> Int {
        if let item = products.first(where: { $0.product.id == product.id }) {
            return item.quantity
        }
        return 0
    }
    
    func decreaseQuantity(product: Product) {
        if let index = products.firstIndex(where: { $0.product.id == product.id && $0.quantity > 0 }) {
            products[index].quantity -= 1
            if products[index].quantity == 0 {
                products.remove(at: index)
            }
            recalculateTotal()
        }
    }
}

struct ProductWithQuantity: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
}
