//
//  DeliveryInfo.swift
//  Shkaf
//
//  Created by Илья on 17.03.2024.
//

import Foundation

struct DeliveryInfo: Identifiable {
    var id: UUID = UUID()
    var cleintName: String
    var clientSurname: String
    var clientPhone: String
    var clientEmail: String
    var clientCity: String
    var clientAddress: String
}
