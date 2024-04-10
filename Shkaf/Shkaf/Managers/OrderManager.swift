//
//  OrderManager.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

class OrderManager: ObservableObject {
    @Published var orders: [Order] = [mockOrder1, mockOrder2]
    
    // Method to add a new order
    func addOrder(_ order: Order) {
        orders.append(order)
    }
    
    func deleteOrder(_ order: Order) {
        orders = orders.filter { $0.id != order.id }
    }
    
}

// Create two mock orders
let mockProduct1 = Product(id: UUID(), category: "Аксессуар", seller: "селлер", name: "Шапка жёлтая", description: "100% шерсть", image: "https://friendfunction.ru/upload/iblock/7ea/oe9wj35euge1a7307fsrk45f6v20xsf8/shapki_friend_function_119.jpg", price: 1300.0)
let mockProduct2 = Product(id: UUID(), category: "Одежда", seller: "селлер", name: "Футболка", description: "100% злопок", image: "https://friendfunction.ru/upload/iblock/7ea/oe9wj35euge1a7307fsrk45f6v20xsf8/shapki_friend_function_119.jpg", price: 2000.0)

let mockDeliveryInfo1 = DeliveryInfoMock(cleintName: "John", clientSurname: "Doe", clientPhone: "123456789", clientEmail: "john@example.com", clientCity: "City", clientAddress: "Address")
let mockDeliveryInfo2 = DeliveryInfoMock(cleintName: "Jane", clientSurname: "Doe", clientPhone: "987654321", clientEmail: "jane@example.com", clientCity: "City", clientAddress: "Address")

let mockOrder1 = Order(id: UUID(), total: 30.0, productList: [ProductWithQuantity(product: mockProduct1, quantity: 1), ProductWithQuantity(product: mockProduct1, quantity: 2)], deliveryInfo: mockDeliveryInfo1, date: Date())
let mockOrder2 = Order(id: UUID(), total: 50.0, productList: [ProductWithQuantity(product: mockProduct1, quantity: 2)], deliveryInfo: mockDeliveryInfo2, date: Date())

// Create an instance of OrderManager



