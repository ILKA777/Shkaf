//
//  Order.swift
//  Shkaf
//
//  Created by Илья on 17.03.2024.
//

import Foundation

struct Order {
    var id = UUID()
    var total: Double
    var productList: [ProductWithQuantity]
    var deliveryInfo: DeliveryInfoMock
    var date: Date
}
