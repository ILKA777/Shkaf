//
//  Requisites.swift
//  Shkaf
//
//  Created by Илья on 09.04.2024.
//

import Foundation

struct BankDetails: Identifiable {
    var id: UUID = UUID()
    var bankName: String
    var accountNumber: String
    var inn: String
    var kpp: String
    var correspondentAccount: String
    var bic: String
    var swiftCode: String
}
