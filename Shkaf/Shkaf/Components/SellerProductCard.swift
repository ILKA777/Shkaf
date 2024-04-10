//
//  SellerProductCard.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

enum ProductStatus: String {
    case forSale = "В продаже"
    case underModeration = "На модерации"
    case soldOut = "Снято с продажи"
}

struct SellerProductCard: View {
    var product: Product
    var status: ProductStatus
    @State private var isLoading = false
    
    var priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        return formatter
    }()
    
    var price = ""
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                AsyncImage(url: URL(string: product.image)!) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .cornerRadius(20)
                            .frame(width: 180)
                            .scaledToFit()
                    case .failure:
                        Image("ShkafLogo")
                            .resizable()
                            .foregroundColor(.gray)
                            .cornerRadius(20)
                            .frame(width: 180)
                    }
                }
                VStack(alignment: .leading) {
                    Text(product.name)
                        .bold()
                    
                    Text(String(format: "%.1f ₽", product.price))
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
                Text(status.rawValue)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(statusColor)
                    .cornerRadius(10)
                    .padding([.top, .trailing], 10)
            }
        }
        .onAppear {
            // Вызываем fetchProducts при загрузке SellerProductsCatalogView
            isLoading = true
            SellerProductsManager.shared.fetchProducts {
                isLoading = false
            }
        }
    }
    
    var statusColor: Color {
        switch status {
        case .forSale:
            return .green
        case .underModeration:
            return .orange
        case .soldOut:
            return .red
        }
    }
}

struct SellerProductCard_Previews: PreviewProvider {
    static var previews: some View {
        SellerProductCard(product: SellerProductsManager.shared.productList[0], status: .forSale)
            .environmentObject(CartManager())
    }
}
