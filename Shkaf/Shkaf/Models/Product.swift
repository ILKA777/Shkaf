//
//  Product.swift
//  Shkaf
//
//  Created by Илья on 05.02.2024.
//

import Foundation

public struct Product: Identifiable, Decodable, Encodable {
    public var id = UUID()
    var category: String
    var name: String
    var description: String
    var image: String
    var price: Double
}

//var productList = [Product(category: "Одежда", name: "Orange sweater", description: "Свитер", image: "sweater1", price: 121.0),
//                   Product(category: "Одежда", name: "Red sweater", description: "Свитер", image: "sweater2", price: 99.0),
//                   Product(category: "Одежда", name: "Blue sweater", description: "Свитер", image: "sweater3", price: 45.0),
//                   Product(category: "Одежда", name: "Green sweater", description: "Свитер", image: "sweater4", price: 89.0),
//                   Product(category: "Одежда", name: "Brown sweater", description: "Свитер", image: "sweater5", price: 201.0),
//                   Product(category: "Одежда", name: "Yellow sweater", description: "Свитер", image: "sweater6", price: 23.0),
//                   Product(category: "Одежда", name: "White sweater", description: "Свитер", image: "sweater7", price: 48.0),
//                   Product(category: "Одежда", name: "Cream sweater", description: "Свитер", image: "sweater8", price: 98.0)]
