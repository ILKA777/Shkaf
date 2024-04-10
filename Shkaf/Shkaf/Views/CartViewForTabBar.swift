//
//  CartViewForTabBar.swift
//  Shkaf
//
//  Created by Илья on 03.03.2024.
//

import SwiftUI

struct CartViewForTabBar: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var orderManager: OrderManager
    @EnvironmentObject var orderViewModel: OrderViewModel
    @State private var isPlacingOrder = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                if cartManager.products.count > 0 {
                    ForEach(cartManager.products, id: \.id) { productWithQuantity in
                        ProductRow(productWithQuantity: productWithQuantity)
                    }
                    
                    HStack {
                        Text("Итого")
                        Spacer()
                        Text("\(cartManager.total.formattedPrice) ₽")
                            .bold()
                    }
                    .padding()
                    
                    Button(action: {
                        isPlacingOrder = true
                    }) {
                        Text("Оформить заказ")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding()
                    .sheet(isPresented: $isPlacingOrder) {
                        OrderView(viewModel: orderViewModel, isPlacingOrder: $isPlacingOrder)
                            .environmentObject(OrderViewModel(cartManager: cartManager, orderManager: orderManager))
                    }
                } else {
                    Text("Ваша корзина пуста")
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
