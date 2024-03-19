//
//  ProductRowFavorites.swift
//  Shkaf
//
//  Created by Илья on 03.03.2024.
//

import SwiftUI
struct ProductRowFavorites: View {
    
    @EnvironmentObject var favoritesManager: FavoritesManager
    var product: Product
    
    var body: some View {
        HStack(spacing: 20) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.categoty)
                               .font(.caption)
                               .foregroundColor(.gray)
                Text(product.name)
                    .bold()
                
                Text("\(product.price) ₽")
            }
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                .onTapGesture {
                    favoritesManager.removeFromFavorites(product: product)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ProductRow(product: productList[3])
        .environmentObject(FavoritesManager())
}
