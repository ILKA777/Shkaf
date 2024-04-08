//
//  ProductRow.swift
//  Shkaf
//
//  Created by Илья on 07.02.2024.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var productWithQuantity: ProductWithQuantity // Use ProductWithQuantity instead of Product
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: productWithQuantity.product.image)!) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .cornerRadius(10)
                                    .frame(width: 50)
                                    .scaledToFit()
                            case .failure:
                                Image("ShkafLogo")
                                    .resizable()
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
                    cartManager.decreaseQuantity(product: productWithQuantity.product) // Pass product to decreaseQuantity
                }) {
                    Image(systemName: "minus.circle")
                        .foregroundColor(.red)
                }
                
                Text("\(productWithQuantity.quantity)")
                
                Button(action: {
                    cartManager.addToCart(product: productWithQuantity.product) // Pass product to addToCart
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



//#Preview {
//    ProductRow(product: productList[3])
//        .environmentObject(CartManager())
//}
