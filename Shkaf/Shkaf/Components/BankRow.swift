//
//  BankRow.swift
//  Shkaf
//
//  Created by Илья on 09.04.2024.
//

import SwiftUI

struct BankRow: View {
    var bankDetails: BankDetails
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Наименование банка: \(bankDetails.bankName)")
                .font(.system(size: 25))
                .bold()
                
            Text("Номер счёта: \(bankDetails.accountNumber)")
                .font(.system(size: 20))
                .bold()
                
            Text("ИНН: \(bankDetails.inn)")
                .font(.system(size: 20))
                .bold()
            
            Text("КПП: \(bankDetails.kpp)")
                .font(.system(size: 20))
                .bold()
            
            Text("Корреспондентский счёт: \(bankDetails.correspondentAccount)")
                .font(.system(size: 20))
                .bold()
            
            Text("БИК банка: \(bankDetails.bic)")
                .font(.system(size: 20))
                .bold()
            
            Text("SWIFT: \(bankDetails.swiftCode)")
                .font(.system(size: 20))
                .bold()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color(uiColor: .CustomGreen())))
        .padding(.horizontal, 0)
    }
}
