//
//  OrderViewModel.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

class OrderViewModel: ObservableObject {
    @Published var cartManager: CartManager
    @Published var orderManager: OrderManager
    @Published var clientName: String = ""
    @Published var clientSurname: String = ""
    @Published var clientPhone: String = ""
    @Published var clientCity: String = ""
    @Published var clientAddress: String = ""
    @Published var clientEmail: String = ""
    
    init(cartManager: CartManager, orderManager: OrderManager) {
        self.cartManager = cartManager
        self.orderManager = orderManager
    }
    
    func placeOrder() {
        let deliveryInfo = DeliveryInfoMock(cleintName: clientName,
                                        clientSurname: clientSurname,
                                        clientPhone: clientPhone,
                                        clientEmail: clientEmail,
                                        clientCity: clientCity,
                                        clientAddress: clientAddress)
        let order = Order(
                          total: Double(cartManager.total),
                          productList: cartManager.products,
                          deliveryInfo: deliveryInfo,
                          date: Date())
        orderManager.addOrder(order)
        
        // Call a method in the view model to handle the order placement
        // This might involve sending the order to a server
        print("Order Placed: \(order)")
    }
    
    func clearCart() {
        cartManager.clearCart()
    }
}
