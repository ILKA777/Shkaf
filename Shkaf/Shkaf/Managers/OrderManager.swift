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
let mockProduct1 = Product(id: UUID(), category: "Аксессуар", name: "Шапка жёлтая", description: "100% шерсть", image: "https://downloader.disk.yandex.ru/preview/f9bffd2099a79590d458b9be471fcab276817a5df9bc4cade41d3d75940c6e76/6612cb4d/hPOLMzj86aniNSBCuAOjWT07SSht2zIZtM-CwvMCw-ft3korpWjUU1ZoIGwbxzPPA5iDHLA_BIRKlih-vHLI_w%3D%3D?uid=0&filename=sweater1.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=0&tknv=v2&size=2518x1308", price: 1300.0)
let mockProduct2 = Product(id: UUID(), category: "Одежда", name: "Футболка", description: "100% злопок", image: "https://downloader.disk.yandex.ru/preview/de59096eed840821fe4616dd4e98ba1ae612250058e27d73982b84d96c52c9e8/6612cbdb/B3qUxxkBsRyrjMI6BcNeYALthpJLWzZikgCiY22uImR11CdVPsq9TmreJJAfjN9bLs3AtlKV9j9UqsIfO7PvAw%3D%3D?uid=0&filename=sweater2.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=0&tknv=v2&size=2048x2048", price: 2000.0)

let mockDeliveryInfo1 = DeliveryInfoMock(cleintName: "John", clientSurname: "Doe", clientPhone: "123456789", clientEmail: "john@example.com", clientCity: "City", clientAddress: "Address")
let mockDeliveryInfo2 = DeliveryInfoMock(cleintName: "Jane", clientSurname: "Doe", clientPhone: "987654321", clientEmail: "jane@example.com", clientCity: "City", clientAddress: "Address")

let mockOrder1 = Order(id: UUID(), total: 30.0, productList: [ProductWithQuantity(product: mockProduct1, quantity: 1), ProductWithQuantity(product: mockProduct1, quantity: 2)], deliveryInfo: mockDeliveryInfo1, date: Date())
let mockOrder2 = Order(id: UUID(), total: 50.0, productList: [ProductWithQuantity(product: mockProduct1, quantity: 2)], deliveryInfo: mockDeliveryInfo2, date: Date())

// Create an instance of OrderManager



