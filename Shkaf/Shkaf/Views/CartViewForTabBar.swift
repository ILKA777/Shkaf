//
//  CartViewForTabBar.swift
//  Shkaf
//
//  Created by Илья on 03.03.2024.
//

import SwiftUI

struct CartViewForTabBar: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        NavigationView {
            ScrollView {
                if cartManager.products.count > 0 {
                    ForEach(cartManager.products, id: \.id) {
                        product in ProductRow(product: product)
                    }
                    
                    HStack {
                        Text("Your cart total is")
                        Spacer()
                        Text("\(cartManager.total).00 ₽")
                            .bold()
                    }
                    .padding()
                    
                    PaymentButton(action: {})
                        .padding()
                } else {
                    Text("Your cart is empty")
                }
            }
            .navigationTitle(Text("Корзина"))
        .padding(.top)
        }
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
