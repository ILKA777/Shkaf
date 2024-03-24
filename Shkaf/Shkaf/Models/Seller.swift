//
//  Seller.swift
//  Shkaf
//
//  Created by Илья on 22.03.2024.
//

import Foundation

struct Seller: Identifiable {
    var id = UUID()
    var name: String
    var surname: String
    var patronymic: String
    var sex: String
    var typeOfOrganization: String
    var inn: String
    var companyName: String
    var productCategory: String
    var email: String
    var passwordHash: String
}
