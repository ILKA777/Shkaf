//
//  SellerProductCard.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

enum ProductStatus: String {
    case forSale = "На продаже"
    case underModeration = "На модерации"
    case soldOut = "Снято с продажи"
}

struct SellerProductCard: View {

    var product: Product
    var status: ProductStatus
    
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
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
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
        SellerProductCard(product: productList[0], status: .forSale)
            .environmentObject(CartManager())
    }
}
