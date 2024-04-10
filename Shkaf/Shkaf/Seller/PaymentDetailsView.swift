//
//  PaymentDetailsView.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

struct PaymentDetailsView: View {
    @Binding var showModal: Bool
    @Binding var requisites: [BankDetails]
    
    @State private var benefeciaryName = ""
    @State private var accountNumber = ""
    @State private var correspondentAccount = ""
    @State private var inn = ""
    @State private var kpp = ""
    @State private var bic = ""
    @State private var swift = ""
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Наименование банка", text: $benefeciaryName)
                TextField("Номер счёта", text: $accountNumber)
                TextField("ИНН", text: $inn)
                TextField("КПП", text: $kpp)
                TextField("Корреспондентский счёт", text: $correspondentAccount)
                TextField("БИК банка", text: $bic)
                TextField("Swift", text: $swift)
            }
            .navigationBarItems(leading: Button("Отмена") {
                showModal = false
            }, trailing: Button("Сохранить") {
                let details =  BankDetails(bankName: benefeciaryName, accountNumber: accountNumber, inn: inn, kpp: kpp, correspondentAccount: correspondentAccount, bic: bic, swiftCode: swift)
                requisites.append(details)
                showModal = false
            })
            .navigationTitle("Реквизиты")
        }
    }
}
//
//#Preview {
//    NewDeliveryInfoView()
//}
