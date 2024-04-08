//
//  CartView.swift
//  Shkaf
//
//  Created by Илья on 07.02.2024.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var orderManager: OrderManager
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    @State private var isPlacingOrder = false
    
    var body: some View {
        ScrollView {
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id) { productWithQuantity in
                    ProductRow(productWithQuantity: productWithQuantity) // Pass ProductWithQuantity to ProductRow
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
                    // Present the OrderView as a sheet
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

#Preview {
    CartView()
        .environmentObject(CartManager())
}
