//
//  FavoritesManager.swift
//  Shkaf
//
//  Created by Илья on 03.03.2024.
//

import Foundation

class FavoritesManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Double = 0.0
    
    func addToFavorites(product: Product) {
        products.append(product)
        total += product.price
    }
    
    func removeFromFavorites(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
    
    func isProductInFavorites(product: Product) -> Bool {
           return products.contains(where: { $0.id == product.id })
       }
}
