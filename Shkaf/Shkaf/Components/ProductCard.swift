//
//  ProductCard.swift
//  Shkaf
//
//  Created by Илья on 05.02.2024.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var product: Product
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                VStack(alignment: .leading) {
                    Text(product.name)
                        .bold()
                    
                    Text("\(product.price) ₽")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
            HStack {
                Button(action: {
                    if !favoritesManager.isProductInFavorites(product: product) {
                        favoritesManager.addToFavorites(product: product)
                    } else {
                        favoritesManager.removeFromFavorites(product: product)
                    }
                    
                }) {
                    
                    Image(systemName: "heart")
                        .padding(10)
                        .foregroundColor(.white)
                        .background(favoritesManager.isProductInFavorites(product: product) == true ? .gray : .red)


                        .cornerRadius(50)
                        .padding(.leading, 10)
                    
                }
                .offset(x: -40)
                
                
                Button {
                    cartManager.addToCart(product: product)
                } label: {
                    Image(systemName: "plus")
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(50)
                        .padding()
                }
            }
            
        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[0])
            .environmentObject(CartManager())
    }
}
