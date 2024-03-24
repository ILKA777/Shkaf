//
//  PaymentDetailsView.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

struct PaymentDetailsView: View {
    @Binding var showModal: Bool
    //@Binding var deliveries: [DeliveryInfo]
    
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
                TextField("Корреспонденский счёт", text: $correspondentAccount)
                TextField("БИК банка", text: $bic)
                TextField("Swift", text: $swift)
            }
            .navigationBarItems(leading: Button("Отмена") {
                showModal = false
            }, trailing: Button("Сохранить") {
//                let newDelivery = DeliveryInfo(cleintName: clientName, clientSurname: clientSurname, clientPhone: clientPhone, clientEmail: clientEmail, clientCity: clientCity, clientAddress: clientAddress)
                //deliveries.append(newDelivery)
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
