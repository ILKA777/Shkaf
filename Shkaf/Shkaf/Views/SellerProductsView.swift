//
//  SellerProductsView.swift
//  Shkaf
//
//  Created by Илья on 09.04.2024.
//

import SwiftUI

struct SellerProductsView: View {
    let seller: String
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    @State private var searchText = "" // To hold the search text
    
    var body: some View {
        VStack {
            Text("Товары от \(seller)")
                .font(.title)
                .padding()
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(filteredProducts, id: \.id) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductCard(product: product)
                        }
                        .environmentObject(cartManager)
                        .environmentObject(favoritesManager)
                    }
                }
                .padding()
            }
        }
    }
    
    private var filteredProducts: [Product] {
        // Фильтрация продуктов по имени продавца
        return SellerProductsManager.shared.productList.filter { $0.seller == seller }
            .filter { searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText) }
    }
}
