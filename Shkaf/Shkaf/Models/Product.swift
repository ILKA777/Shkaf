//
//  Product.swift
//  Shkaf
//
//  Created by Илья on 05.02.2024.
//

import Foundation

public struct Product: Identifiable, Decodable, Encodable {
    public var id = UUID()
    var localId: Int?
    var category: String
    var seller: String
    var name: String
    var description: String
    var image: String
    var price: Double
}
