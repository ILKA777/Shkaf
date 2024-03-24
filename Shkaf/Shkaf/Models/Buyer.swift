//
//  Buyer.swift
//  Shkaf
//
//  Created by Илья on 22.03.2024.
//

import Foundation

struct Buyer: Identifiable {
    var id = UUID()
    var name: String
    var surname: String
    var address: String
    var phone: String
    var email: String
    var passwordHash: String
}
