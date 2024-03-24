//
//  ProductRowForOrders.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

struct ProductRowForOrders: View {
    
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        HStack(spacing: 20) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.category)
                               .font(.caption)
                               .foregroundColor(.gray)
                Text(product.name)
                    .foregroundColor(.black)
                    .bold()
                
                Text("\(product.price) ₽")
                    .foregroundColor(.black)
            }
            
            Spacer()
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
