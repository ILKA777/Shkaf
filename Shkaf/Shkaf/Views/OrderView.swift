//
//  OrderView.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var viewModel: OrderViewModel
    @Binding var isPlacingOrder: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Cart section
                if viewModel.cartManager.products.count > 0 {
                    Text("Ваш заказ:")
                        .font(.headline)
                        .padding(.bottom)
                    
                    ForEach(viewModel.cartManager.products) { productWithQuantity in
                        ProductRow(productWithQuantity: productWithQuantity)
                    }
                    .padding(.bottom)
                } else {
                    Text("Your cart is empty")
                        .padding(.bottom)
                }
                
                // Customer information section
                Text("Информация о доставке:")
                    .font(.headline)
                    .padding(.bottom)
                
                TextField("Имя получателя", text: $viewModel.clientName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
                
                TextField("Фамилия получателя", text: $viewModel.clientSurname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
                
                TextField("Телефон получателя", text: $viewModel.clientPhone)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
                
                TextField("Электронная почта", text: $viewModel.clientEmail)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
                
                TextField("Город", text: $viewModel.clientCity)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
                
                TextField("Адрес", text: $viewModel.clientAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
                
                // Place Order button
                Button(action: {
                    viewModel.placeOrder()
                    viewModel.clearCart()
                    isPlacingOrder = false
                }) {
                    Text("Оформить заказ")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(uiColor: .CustomGreen()))
                        .cornerRadius(8)
                }
                .padding(.bottom)
            }
            .padding()
        }
        .navigationTitle(Text("Order Details"))
        .padding(.top)
    }
}

