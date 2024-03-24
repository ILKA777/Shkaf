//
//  OrderManager.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

class OrderManager: ObservableObject {
    @Published var orders: [Order] = []
    
    // Method to add a new order
    func addOrder(_ order: Order) {
        orders.append(order)
    }
}
