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
    var productList: [Product]
    var deliveryInfo: DeliveryInfo
    var date: Date
}
