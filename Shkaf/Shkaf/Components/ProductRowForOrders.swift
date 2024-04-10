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
            AsyncImage(url: URL(string: product.image)!) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 50, height: 50)
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .cornerRadius(10)
                case .failure:
                    Image("ShkafLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
                        .frame(width: 50)
                        .cornerRadius(10)
                }
            }
            
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
