//
//  ProductRow.swift
//  Shkaf
//
//  Created by Илья on 07.02.2024.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var productWithQuantity: ProductWithQuantity
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: productWithQuantity.product.image)!) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width: 50)
                    
                case .failure:
                    Image("ShkafLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                        .frame(width: 50)
                }
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(productWithQuantity.product.category)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(productWithQuantity.product.name)
                    .bold()
                
                Text("\(productWithQuantity.product.price.formattedPrice) ₽")
            }
            
            Spacer()
            
            HStack(spacing: 10) {
                Button(action: {
                    cartManager.decreaseQuantity(product: productWithQuantity.product)
                }) {
                    Image(systemName: "minus.circle")
                        .foregroundColor(.red)
                }
                
                Text("\(productWithQuantity.quantity)")
                
                Button(action: {
                    cartManager.addToCart(product: productWithQuantity.product)
                }) {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.green)
                }
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct QuantityCounter: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                cartManager.decreaseQuantity(product: product)
            }) {
                Image(systemName: "minus")
            }
            .buttonStyle(BorderlessButtonStyle())
            .foregroundColor(.blue)
            
            Text("\(cartManager.quantity(for: product))")
                .padding(.horizontal, 10)
                .background(Color.gray.opacity(0.2))
            
            Button(action: {
                cartManager.addToCart(product: product)
            }) {
                Image(systemName: "plus")
            }
            .buttonStyle(BorderlessButtonStyle())
            .foregroundColor(.blue)
        }
    }
}
