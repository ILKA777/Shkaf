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
    
    init() {
        loadFavoritesFromUserDefaults()
    }
    
    func addToFavorites(product: Product) {
        products.append(product)
        total += product.price
        saveFavoritesToUserDefaults()
    }
    
    func removeFromFavorites(product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products.remove(at: index)
            total -= product.price
            saveFavoritesToUserDefaults()
        }
    }
    
    func isProductInFavorites(product: Product) -> Bool {
        return products.contains(where: { $0.id == product.id })
    }
    
    private func loadFavoritesFromUserDefaults() {
        if let savedData = UserDefaults.standard.data(forKey: "favoriteProducts"),
           let decodedFavorites = try? JSONDecoder().decode([Product].self, from: savedData) {
            products = decodedFavorites
            total = products.reduce(0.0) { $0 + $1.price }
        }
    }
    
    private func saveFavoritesToUserDefaults() {
        if let encodedData = try? JSONEncoder().encode(products) {
            UserDefaults.standard.set(encodedData, forKey: "favoriteProducts")
        }
    }
}
